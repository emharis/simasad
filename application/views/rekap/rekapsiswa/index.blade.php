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
             * Cari siswa dengan NIS
             */
            var siswa;
            jQuery('.btn-cari-nis').click(function(){
                var nis = jQuery('#input-nis').val();
                var tahunajaran = jQuery('select[name=tahunajaran]').val();
                var getSiswaUrl = "{{ URL::to('rekap/rekapsiswa/siswabynis') }}" + "/" + tahunajaran + "/" + nis;
                jQuery.ajax({url:getSiswaUrl,dataType:"json",async:false,cache: false,
                    success:function(data){
                      siswa = data;
                      //set siswa to form
                      jQuery('input[name=nama]').val(siswa.siswa);
                      jQuery('input[name=rombel]').val(siswa.rombel);
                      //clear data rekap
                      jQuery('#table-spp,#table-partisipasi,#table-transaksi').empty();
                    },
                    error:function(data){
                        alert('Data Siswa tidak ditemukan.');
                        jQuery('input[name=nama]').val('');
                        jQuery('input[name=rombel]').val('');
                    }
                });
            });
            
            /**
             * Cari siswa dengan nama
             */
             jQuery('input[name=nama]').on('focus',function(){
                    //clear inputan sebelumnya
                    jQuery('input[name=namasiswa]').val('');
                    jQuery('.form-list-siswa').empty();
                    
                    jQuery('#list-siswa-dialog').modal('show');
             });
             jQuery('#btn-cari-siswa').click(function(){
                 findSiswa();
             });
             function findSiswa(){
                var nama = jQuery('input[name=namasiswa]').attr('value');
                var tahunajaran = jQuery('select[name=tahunajaran]').val();
                var getSiswaUrl = "{{ URL::to('rekap/rekapsiswa/viewsiswabynama') }}" + "/" + tahunajaran + "/" + nama;
                jQuery('.form-list-siswa').load(getSiswaUrl,function(){
                        /**
                         * tampilkan data siswa yang terpilih ke form
                         */
                        jQuery('.btn-pilih').click(function(){
                            jQuery('input[name=nis]').attr('value',jQuery(this).attr('nis'));
                            jQuery('.btn-cari-nis').trigger({type: 'click'
                            });
                        });
                });
             };
             
             /**
              * Tampilkan data transaksi
              */
              jQuery('#buttonTampil').click(function(){
                    if(siswa != null){
                        //tampilkan tabel spp
                        var tahunajaran = jQuery('select[name=tahunajaran]').val();
                        var getSppUrl = "{{ URL::to('rekap/rekapsiswa/transaksispp') }}" + "/" + tahunajaran + "/" + siswa.siswa_id;
                        jQuery('#table-spp').load(getSppUrl);
                        
                        //tampilkan table partisipasi
                        var getPartisipasiUrl = "{{ URL::to('rekap/rekapsiswa/transaksipartisipasi') }}" + "/" + tahunajaran + "/" + siswa.siswa_id;
                        jQuery('#table-partisipasi').load(getPartisipasiUrl);
                        
                        //tampilkan table transaksi
                        var getTransaksiUrl = "{{ URL::to('rekap/rekapsiswa/transaksi') }}" + "/" + tahunajaran + "/" + siswa.siswa_id;
                        jQuery('#table-transaksi').load(getTransaksiUrl);
                    }else{
                        alert('Lengkapi data yang kosong.');
                    }
              });
            
            
//             /**
//              * buttonTampil click event
//              */
//             jQuery('#buttonTampil').click(function(){
//                //tampilkan table rekap
//                    var tahunajaranId = jQuery('select[name=tahunajaran]').val();
//                    var bulan = jQuery('input[name=bulan]').val();
//                    var opsi = jQuery('input[name=opsi]:checked').val();
//                    
//                    if(tahunajaranId != null && bulan != ''){
//                        if(opsi == 2){
//                            //tampilkan detil per transaksi
//                            var loadUrl = "{{ URL::to('rekap/bulanan/ajaxtabel') }}" + "/" + tahunajaranId + "/" + bulan ;
//                        }else if(opsi == 1){
//                            //tampilkan berdesasar kelompok jenis biaya
//                            var loadUrl = "{{ URL::to('rekap/bulanan/ajaxtabeldetil') }}" + "/" + tahunajaranId + "/" + bulan ;
//                        }   
//                            //tampilkan tabel rekapitulasi
//                            jQuery('#tabelrekap').load(loadUrl);
//                    }else{
//                        alert('.:PERINGATAN:: Lengkapi data yang kosong.');
//                    }
//             });
//             /**
//              * buttonPrint event clicked
//              * Printe data ke file PDF
//              */
//             jQuery('.buttonPrint').click(function(){
//                    var tahunajaranId = jQuery('select[name=tahunajaran]').val();
//                    var bulan = jQuery('input[name=bulan]').val();
//                    var opsi = jQuery('input[name=opsi]:checked').val();
//                    
//                    if(tahunajaranId != null && bulan != ''){
//                        var printUrl ="";
//                        if(opsi == 2){
//                            //tampilkan detil per transaksi
//                            printUrl = "{{ URL::to('rekap/bulanan/printtopdf') }}" + "/" + tahunajaranId + "/" + bulan ;
//                        }else if(opsi == 1){
//                            //tampilkan berdesasar kelompok jenis biaya
//                            printUrl = "{{ URL::to('rekap/bulanan/printtopdfdetil') }}" + "/" + tahunajaranId + "/" + bulan ;
//                        }   
//                        
//                        //redirect
//                    window.location.href = printUrl;
//                    }else{
//                        alert('.:PERINGATAN:: Lengkapi data yang kosong.');
//                    }
//                    
//                return false;
//             });
             
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
            <h2><i class="icon-th"></i> Rekapitulasi Transaksi Siswa</h2>
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
                                    <td>Siswa</td>
                                    <td>
                                        <div class="input-append" style="margin:0;padding:0;">
                                            <input id="input-nis" name="nis" placeholder="NIS" class="input-mini" type="text"><button class="btn btn-success btn-cari-nis" type="button"><i class="icon-search icon-white"></i></button>
                                        </div>
                                        
                                    <td><?php echo Laravel\Form::text('nama', null, array('class'=>'input-xlarge','placeholder'=>'NAMA')); ?></td>
                                    <td><?php echo Laravel\Form::text('rombel', null, array('class'=>'input-large','placeholder'=>'ROMBEL')); ?></td>
                                    <td>
                                        <a href="#" class="btn btn-primary" id="buttonTampil">Tampilkan</a>
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

<div class="row-fluid">
    <div class="box span4">
        <div class="box-header well" data-original-title="">
            <h2><i class="icon-th"></i> Rekapitulasi Pembayaran SPP</h2>
            <div class="box-icon"></div>
        </div>
        <div class="box-content" id="table-spp">
            
        </div>
    </div>
    <div class="box span3">
        <div class="box-header well" data-original-title="">
            <h2><i class="icon-th"></i> Rekap Pembayaran Partisipasi</h2>
            <div class="box-icon"></div>
        </div>
        <div class="box-content" id="table-partisipasi">
            
        </div>
    </div>
    <div class="box span5">
        <div class="box-header well" data-original-title="">
            <h2><i class="icon-th"></i> Rekapitulasi Transaksi Pembayaran</h2>
            <div class="box-icon"></div>
        </div>
        <div class="box-content" id="table-transaksi">
        </div>
    </div>
    
</div>

<!--DIALOG/MODAL untuk pencarian data siswa menggunakan namanya-->
<div class="modal hide fade" id="list-siswa-dialog">
        <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">×</button>
                <h3 class="modal-title">Data Siswa</h3>
        </div>
        <div class="modal-body">
            <table class="table table-striped" >
                <tbody>
                    <tr >
                        <td style="border-top: none!important;">Nama</td>
                        <td style="border-top: none!important;">
                            <?php echo \Laravel\Form::text('namasiswa',null,array('class' => 'input-large','autofocus','autocomplete'=>'off'));  ?>
                            <button id="btn-cari-siswa" class="btn btn-primary"><i class="icon-white icon-search"></i></button>
                        </td>
                    </tr>
                </tbody>
            </table>
            <div id="modal-custom-message" class="form-list-siswa" >
                
            </div>
        </div>
        <div class="modal-footer">
                <a href="#" class="btn btn-warning" data-dismiss="modal">BATAL</a>
                <!--<a href="#" class="btn btn-primary">OK</a>-->
        </div>
</div>
<!--END Form Pencarian Data Siswa Dengan nama-->