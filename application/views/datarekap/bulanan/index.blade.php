@section('custom_script')
    <script type="text/javascript">
        jQuery(document).ready(function(){
                    var loader = '<div class="loader"></div>' ;
                   /**
                    * Set tahun ajaran aktif
                    */
                   function setTahunAjaranAktif(){
                       var tahunaktif_id = "{{ $tahunaktif->id }}";
                       jQuery('select[name=tahunajaran] option[value=' + tahunaktif_id + ']').css('background-color','green');
                       jQuery('select[name=tahunajaran] option[value=' + tahunaktif_id + ']').css('color','white');
                   }
                   setTahunAjaranAktif();
                   
                   /**
                    * button tampil clicked
                    */
                   jQuery('button[name=tampil]').click(function(){
                       var tahunajaran = jQuery('select[name=tahunajaran]').val();
                       var bulan = jQuery('input[name=bulan]').val();
                       //var akhir = jQuery('input[name=tanggalAkhir]').val();
                       var tampilkan = jQuery('select[name=tampilan]').val();
                       
                       //disable inputan
                       jQuery('select[name=tahunajaran]').attr('disabled','disabled');
                       jQuery('input[name=bulan]').attr('readonly','readonly');
                       jQuery('input[name=tanggalAkhir]').attr('readonly','readonly');
                       jQuery('select[name=tampilan]').attr('disabled','disabled');
                       jQuery('button[name=tampil]').attr('disabled','disabled');
                       
                       if (tampilkan == 0){
                           var getDataUrl = "{{ URL::to('datarekap/rekapbulanan/datarekapgroup') }}" + "/" + tahunajaran + "/" + bulan ;
                       }else if(tampilkan == 1){
                           var getDataUrl = "{{ URL::to('datarekap/rekapbulanan/datarekapdetil') }}" + "/" + tahunajaran + "/" + bulan ;
                       }
                       
                       jQuery('#tabel-rekap-content').html(loader).load(getDataUrl,'',function(){
                            //hide table input
                            jQuery('#form-input').hide(500);
                       });
                   });
                   
                   /**
                    * Cetak data rekap
                    */
                   jQuery(document).on('click','.btn-cetak',function(){
                       var tahunajaran = jQuery('select[name=tahunajaran]').val();
                       var awal = jQuery('input[name=bulan]').val();
                       var akhir = jQuery('input[name=tanggalAkhir]').val();
                       var tampilkan = jQuery('select[name=tampilan]').val();
                       
                       if (tampilkan == 0){
                           var printUrl = "{{ URL::to('datarekap/rekapbulanan/printgroup')  }}" + "/" + tahunajaran + "/" + awal + "/" + akhir;
                       }else if(tampilkan == 1){
                           var printUrl = "{{ URL::to('datarekap/rekapbulanan/printdetil')  }}" + "/" + tahunajaran + "/" + awal + "/" + akhir;
                       }
                       
                       window.location.href = printUrl;
                   })
        });
    </script>
@endsection

@section('custom_style')
    <style type="text/css">
        table.table-input tbody tr td{
            padding: 5px!important;
        }
        
        table.table-input tbody tr td input,table tbody tr td text,table tbody tr td select{
            vertical-align: middle!important;
            margin: 0;
        }
        
        table.table tbody tr td{
            vertical-align: middle;
        }
    </style>
@endsection
    
                        <div class="row-fluid sortable ui-sortable" id="form-input">
                            <div class="box span12">
                                <div class="box-header well" data-original-title="">
                                    <h2><i class="icon-th"></i> Data Rekapitulasi Transaksi Bulanan</h2>
                                    <div class="box-icon">
                                    </div>
                                </div>
                                <div class="box-content">
                                    <table class="table-input">
                                        <tbody>
                                            <tr>
                                                <td>Tahun Ajaran</td>
                                                <td>{{ \Laravel\Form::select('tahunajaran', $selectTahunajaran,(isset($tahunaktif) ? $tahunaktif->id : null),array('id'=>'selectTahun','style'=>'width:125px;')) }}</td>
                                                <td>Bulan</td>
                                                <td>
                                                    {{ \Laravel\Form::text('bulan',null,array('id'=>'textTanggal','class'=>'bulandatepicker input-small','placeholder'=>'tanggal awal','autocomplete'=>'off')) }}
                                                </td>
                                                <td>Tampilkan</td>
                                                <td><?php echo Form::select('tampilan',array('0'=>'Per Jenis Biaya','1'=>'Per Detil Transaksi')); ?></td>
                                                <td>
                                                    <button class="btn btn-primary" name="tampil" id="buttonTampil" >Tampilkan</button>
                                                    <!--<button class="btn btn-success btn-cetak" name="cetak" >Cetak</button>-->
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>                               
                        </div>

                        <div class="row-fluid sortable ui-sortable" id="tabelrekapitulasi">
                            <div class="box span12">
                                <div class="box-header well" data-original-title="">
                                    <h2><i class="icon-th"></i> Tabel Rekapitulasi Bulanan</h2>
                                    <div class="box-icon">
                                        <!--<a href="#" class="btn buttonPrint"><i class="icon-print"></i></a>-->
                                    </div>
                                </div>
                                <div class="box-content">
                                    <div id="tabel-rekap-content">
                                    </div>
                                </div>
                            </div><!--/span-->
                        </div>
