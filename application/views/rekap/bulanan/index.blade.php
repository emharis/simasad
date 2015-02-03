@section('custom_script')
    <script type="text/javascript">
        jQuery(document).ready(function(){
            /**
             * Set tahun ajaran aktif
             */
            function setTahunAjaranAktif(){
                var tahunaktif_id = "{{ $tahunaktif->id }}";
                jQuery('#selectTahun option[value=' + tahunaktif_id + ']').css('background-color','green');
                jQuery('#selectTahun option[value=' + tahunaktif_id + ']').css('color','white');
            }
            setTahunAjaranAktif();
             /**
              * buttonTampil click event
              */
             jQuery('#buttonTampil').click(function(){
                //tampilkan table rekap
                    var tahunajaranId = jQuery('select[name=tahunajaran]').val();
                    var bulan = jQuery('input[name=bulan]').val();
                    var opsi = jQuery('input[name=opsi]:checked').val();
                    
                    if(tahunajaranId != null && bulan != ''){
                        if(opsi == 2){
                            //tampilkan detil per transaksi
                            var loadUrl = "{{ URL::to('rekap/bulanan/ajaxtabel') }}" + "/" + tahunajaranId + "/" + bulan ;
                        }else if(opsi == 1){
                            //tampilkan berdesasar kelompok jenis biaya
                            var loadUrl = "{{ URL::to('rekap/bulanan/ajaxtabeldetil') }}" + "/" + tahunajaranId + "/" + bulan ;
                        }   
                            //tampilkan tabel rekapitulasi
                            jQuery('#tabelrekap').load(loadUrl);
                    }else{
                        alert('.:PERINGATAN:: Lengkapi data yang kosong.');
                    }
             });
             /**
              * buttonPrint event clicked
              * Printe data ke file PDF
              */
             jQuery('.buttonPrint').click(function(){
                    var tahunajaranId = jQuery('select[name=tahunajaran]').val();
                    var bulan = jQuery('input[name=bulan]').val();
                    var opsi = jQuery('input[name=opsi]:checked').val();
                    
                    if(tahunajaranId != null && bulan != ''){
                        var printUrl ="";
                        if(opsi == 2){
                            //tampilkan detil per transaksi
                            printUrl = "{{ URL::to('rekap/bulanan/printtopdf') }}" + "/" + tahunajaranId + "/" + bulan ;
                        }else if(opsi == 1){
                            //tampilkan berdesasar kelompok jenis biaya
                            printUrl = "{{ URL::to('rekap/bulanan/printtopdfdetil') }}" + "/" + tahunajaranId + "/" + bulan ;
                        }   
                        
                        //redirect
                    window.location.href = printUrl;
                    }else{
                        alert('.:PERINGATAN:: Lengkapi data yang kosong.');
                    }
                    
                return false;
             });
             
        });
    </script>
@endsection

@section('custom_style')
    <style type="text/css">
        table td{
            vertical-align: middle;
            padding: 5px;
        }
        table td input{
            vertical-align: middle!important;
            margin:0!important;
        }
    </style>
@endsection
<div class="row-fluid sortable ui-sortable">
    <div class="box span12">
        <div class="box-header well" data-original-title="">
            <h2><i class="icon-th"></i> Rekapitulasi Keuangan Bulanan</h2>
            <div class="box-icon">
                <!--<a href="#" class="btn xbuttonPrint"><i class="icon-print"></i></a>-->
            </div>
        </div>
        <div class="box-content">
            <div class="span12">
                <div class="box-content">
                    <fieldset>
                        <table>
                            <tbody>
                                <tr>
                                    <td>Tahun Ajaran</td>
                                    <td>{{\Laravel\Form::select('tahunajaran', $selectTahunajaran,(isset($tahunaktif) ? $tahunaktif->id : null),array('id'=>'selectTahun','style'=>'width:125px;margin:0;'))}}</td>
                                    <td>Bulan</td>
                                    <td><?php echo Laravel\Form::text('bulan', null, array('class'=>'input-mini bulandatepicker')); ?></td>
                                    <td>
                                        <?php echo Laravel\Form::radio('opsi', 2, true); ?>
                                        Kelompokkan per Jenis Biaya
                                    </td>
                                    <td>
                                        <?php echo Laravel\Form::radio('opsi', 1, false); ?>
                                        Tampilkan detil per transaksi
                                    </td>
                                    <td>
                                        <a href="#" class="btn btn-primary" id="buttonTampil">Tampilkan</a>
                                        <a href="#" class="btn btn-success buttonPrint" >Cetak</a>
                                    </td>
                                    <td></td>
                                </tr>
                            </tbody>
                        </table>
                    </fieldset>
                    <br/>
                    <div id="tabelrekap">

                    </div>
                </div>
            </div>
        </div>
    </div><!--/span-->
</div>
