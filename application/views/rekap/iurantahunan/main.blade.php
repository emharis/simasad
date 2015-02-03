@section('custom_script')
    <script type="text/javascript">
        jQuery(document).ready(function(){
                /**
                 * set to not selected
                 * set hide
                 * @type String
                 */
                jQuery('select[name=selectBiaya]').val([]);
                jQuery('select[name=selectJenjang]').val([]);
                jQuery('select[name=selectRombel]').val([]);
                jQuery('input.form-filter').attr('readonly','readonly');
                jQuery('select.form-filter').attr('disabled','disabled');
                jQuery('button.form-filter').attr('disabled','disabled');

                /**
                 * Tahun ajaran aktif
                 */
                var tahunAktifId = "{{ $tahunaktif->id }}";
                jQuery('select[name=tahunajaran] option[value="' + tahunAktifId + '"]').css('background-color','green');
                jQuery('select[name=tahunajaran] option[value="' + tahunAktifId + '"]').css('color','white');
                /**
                 * Tampilkan Data Rekapitulasi
                 */
                jQuery('button[name=tampil]').click(function(){
                        var tahunajaranId = jQuery('select[name=tahunajaran]').val();
                        var jenisbiayaId = jQuery('select[name=selectBiaya]').val();
                        if(jenisbiayaId != null){
                            var loadUrl = "{{ URL::to('rekap/iurantahunan/ajaxtabelrekap') }}" + "/" + tahunajaranId + "/" + jenisbiayaId;
                            jQuery('#formTabelRekap').load(loadUrl,function(){
                                //enablekan filter
                                jQuery('input.form-filter').removeAttr('readonly');
                                jQuery('select.form-filter').removeAttr('disabled');
                                jQuery('button.form-filter').removeAttr('disabled');
                                //disablekan input
                                jQuery('select[name=tahunajaran]').attr('disabled','disabled');
                                jQuery('select[name=selectBiaya]').attr('disabled','disabled');
                                jQuery('button[name=tampil]').attr('disabled','disabled');
                            });
                        }else{
                            alert('.:PERINGATAN :: Lengkapi data yang kosong.');
                        }
                });
                /**
                 * Cetak Print
                 * @returns {undefined}
                 */
                jQuery('.btn-cetak-no-filter').click(function(){
                        var tahunajaranId = jQuery('select[name=tahunajaran]').val();
                        var jenisbiayaId = jQuery('select[name=selectBiaya]').val();
                        if(jenisbiayaId != null){
                            var printUrl = "{{URL::to('rekap/iurantahunan/printtopdf')}}" + "/" + tahunajaranId + "/" + jenisbiayaId;
                            window.location.href = printUrl;
                        }else{
                            alert('.:PERINGATAN :: Lengkapi data yang kosong.');
                        }
                });
                /**
                 * Cetak Print Filter Jenjang
                 * @returns {undefined}
                 */
                jQuery('.btn-cetak-filter-jenjang').click(function(){
                        var tahunajaranId = jQuery('select[name=tahunajaran]').val();
                        var jenisbiayaId = jQuery('select[name=selectBiaya]').val();
                        var jenjang = jQuery('select[name=selectJenjang]').val();
                        if(jenjang != null){
                            var printUrl = "{{URL::to('rekap/iurantahunan/printtopdffilterjenjang')}}"+"/"+tahunajaranId+"/"+jenisbiayaId+"/"+jenjang;
                            window.location.href = printUrl;
                        }else{
                            alert('.:PERINGATAN :: Lengkapi data yang kosong.');
                        }
                });
                /**
                 * Cetak Print Filter Rombel
                 * @returns {undefined}
                 */
                jQuery('.btn-cetak-filter-rombel').click(function(){
                        var tahunajaranId = jQuery('select[name=tahunajaran]').val();
                        var jenisbiayaId = jQuery('select[name=selectBiaya]').val();
                        var rombel = jQuery('select[name=selectRombel]').val();
                        if(rombel != null){
                            var printUrl = "{{URL::to('rekap/iurantahunan/printtopdffilterrombel')}}"+"/"+tahunajaranId+"/"+jenisbiayaId+"/"+rombel;                            
                            window.location.href = printUrl;
                        }else{
                            alert('.:PERINGATAN :: Lengkapi data yang kosong.');
                        }
                });
                /**
                 * Cetak Print Filter NIS
                 * @returns {undefined}
                 */
                jQuery('.btn-cetak-filter-nis').click(function(){
                        var tahunajaranId = jQuery('select[name=tahunajaran]').val();
                        var jenisbiayaId = jQuery('select[name=selectBiaya]').val();
                        var nis = jQuery('input[name=textNomorInduk]').val();
                        if(nis != ''){
                            var printUrl = "{{URL::to('rekap/iurantahunan/printtopdffilternis')}}"+"/"+tahunajaranId+"/"+jenisbiayaId+"/"+nis;                            
                            window.location.href = printUrl;
                        }else{
                            alert('.:PERINGATAN :: Lengkapi data yang kosong.');
                        }
                });
                /**
                 * Filter by Jenjang
                 * @returns {undefined}
                 */
                jQuery('.btn-filter-by-jenjang').click(function(){
                    var tahunajaranId = jQuery('select[name=tahunajaran]').val();
                    var jenisbiayaId = jQuery('select[name=selectBiaya]').val();
                    var jenjang = jQuery('select[name=selectJenjang]').val();
                    if(jenjang != null){
                        //hidden tabel rekap terlebih dahulu
                        jQuery('#formTabelRekap').empty();
                        //filter by jenjang
                        var loadUrl = "{{ URL::to('rekap/iurantahunan/ajaxtabelrekapfilterjenjang') }}" + "/" + tahunajaranId + "/" + jenisbiayaId + "/" + jenjang;
                        //tampilkan tabel rekapitulasi
                        jQuery('#formTabelRekap').load(loadUrl);

                        //end of filter by biaya
                    }else{
                        showMessage('PERINGATAN','Lengkapi data yang masih kosong.');
                    }
                });
                /**
                 * Filter by Rombel
                 * @returns {undefined}
                 */
                jQuery('.btn-filter-by-rombel').click(function(){
                    var tahunajaranId = jQuery('select[name=tahunajaran]').val();
                    var jenisbiayaId = jQuery('select[name=selectBiaya]').val();
                    var rombel = jQuery('select[name=selectRombel]').val();
                    if(rombel != null){
                        //hidden tabel rekap terlebih dahulu
                        jQuery('#formTabelRekap').empty();
                        //filter by jenjang
                        var loadUrl = "{{ URL::to('rekap/iurantahunan/ajaxtabelrekapfilterrombel') }}" + "/" + tahunajaranId + "/" + jenisbiayaId + "/" + rombel;
                        //tampilkan tabel rekapitulasi
                        jQuery('#formTabelRekap').load(loadUrl);

                        //end of filter by biaya
                    }else{
                        showMessage('PERINGATAN','Lengkapi data yang masih kosong.');
                    }
                });
                /**
                 * Filter by NIS
                 * @returns {undefined}
                 */
                jQuery('.btn-filter-by-nis').click(function(){
                    var tahunajaranId = jQuery('select[name=tahunajaran]').val();
                    var jenisbiayaId = jQuery('select[name=selectBiaya]').val();
                    var nis = jQuery('input[name=textNomorInduk]').val();
                    if(nis != ''){
                        //hidden tabel rekap terlebih dahulu
                        jQuery('#formTabelRekap').empty();
                        //filter by jenjang
                        var loadUrl = "{{ URL::to('rekap/iurantahunan/ajaxtabelrekapfiltersiswa') }}" + "/" + tahunajaranId + "/" + jenisbiayaId + "/" + nis;
                        //tampilkan tabel rekapitulasi
                        jQuery('#formTabelRekap').load(loadUrl);

                        //end of filter by biaya
                    }else{
                        showMessage('PERINGATAN','Lengkapi data yang masih kosong.');
                    }
                });
                /**
                 * Reset saat select change
                 */
                jQuery('select[name=selectJenjang]').change(function(){
                        //reset fiter rombel dan siswa
                        jQuery('select[name=selectRombel]').val([]);
                        jQuery('input[name=textNomorInduk]').attr('value','');
                        //reset formTabelRekap
                        jQuery('#formTabelRekap').empty();
                });
                jQuery('select[name=selectRombel]').change(function(){
                        //reset fiter jenjang dan siswa
                        jQuery('select[name=selectJenjang]').val([]);
                        jQuery('input[name=textNomorInduk]').attr('value','');
                        //reset formTabelRekap
                        jQuery('#formTabelRekap').empty();
                });
                jQuery('input[name=textNomorInduk]').change(function(){
                        //reset fiter jenjang dan rombel
                        jQuery('select[name=selectJenjang]').val([]);
                        jQuery('select[name=selectRombel]').val([]);
                        //reset formTabelRekap
                        jQuery('#formTabelRekap').empty();
                });
                
                /**
                 * Fungsi format rupiah untuk class uang 
                 */
//                function formatToRupiah(){
//                   jQuery('.uang').each(function(){
//                       var uang = jQuery(this).text();
//                       uang = jQuery.trim(uang);
//                       uang = formatRupiahVal(uang);
//                       uang  = uang.replace('Rp. ','');
//                       uang  = uang.replace('(','- ');
//                       uang  = uang.replace(')','');
//                       jQuery(this).text(uang);
//                   });
//                }
             
        });
    </script>
@endsection

@section('custom_style')
    <style type="text/css">
        
        table tbody tr td{
            padding: 5px!important;
        }
        
        table tbody tr td input,table tbody tr td text,table tbody tr td select{
            vertical-align: middle!important;
            margin: 0;
        }
        
        table.table tbody tr td{
            vertical-align: middle;
        }
    </style>
@endsection

<div class="row-fluid sortable ui-sortable">
    <div class="box span12">
        <div class="box-header well" data-original-title="">
            <h2><i class="icon-th"></i> Rekapitulasi Iuran Tahunan</h2>
            <div class="box-icon">
                <!--<a href="#" class="btn btn-minimize "><i class="icon icon-darkgray icon-help"></i></a>-->
            </div>
        </div>
        <div class="box-content">
            <div class="span6">
                    <table>
                        <tbody>
                            <tr>
                                <td>Tahun Ajaran</td>
                                <td>{{\Laravel\Form::select('tahunajaran', $tahunajaranselect,(isset($tahunaktif) ? $tahunaktif->id : null),array('id'=>'selectTahun','style'=>'width:125px;'))}}</td>
                                <td>Jenis Iuran</td>
                                <td>{{Form::select('selectBiaya',$biayaselect,null,array('id'=>'selectBiaya','class' => 'input-medium'))}}</td>
                                <td>
                                    <button name="tampil" class="btn btn-primary" id="buttonTampil" >Tampilkan</button>
                                    <button class="btn btn-success btn-cetak-no-filter" >Cetak</button>
                                </td>
                            </tr>
                            <tr>
                                <td>Filter Jenjang</td>
                                <td colspan="3">
                                    {{Form::select('selectJenjang',array('1'=>'1','2'=>'2','3'=>'3','4'=>'4','5'=>'5','6'=>'6'),null,array('id'=>'selectJenjang','class'=>'input-small form-filter'))}}
                                    <button class="btn btn-primary btn-filter-by-jenjang form-filter" >Filter</button>
                                    <button class="btn btn-success btn-cetak-filter-jenjang form-filter" >Cetak</button>
                                </td>
                                <td></td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
            </div>
            <div class="span6">
                    <table>
                        <tbody class="form-filter">
                            <tr>
                                <td>Filter Rombel</td>
                                <td>{{Form::select('selectRombel',$rombelselect,null,array('id'=>'selectRombel','class'=>'input-large form-filter'))}}</td>
                                <td>
                                    <button class="btn btn-primary btn-filter-by-rombel form-filter" >Filter</button>
                                    <button class="btn btn-success btn-cetak-filter-rombel form-filter" >Cetak</button>
                                </td>
                            </tr>
                            <tr>
                                <td>Filter Siswa</td>
                                <td>{{Form::text('textNomorInduk',null,array('id'=>'textNomorInduk','placeholder'=>'Nomor Induk','class'=>'input-medium form-filter','style'=>'margin:0;'))}}</td>
                                <td>
                                    <button class="btn btn-primary btn-filter-by-nis form-filter" >Filter</button>
                                    <button class="btn btn-success btn-cetak-filter-nis form-filter" >Cetak</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                <br/>
            </div>
        </div>
    </div><!--/span-->
</div>

<div class="row-fluid sortable ui-sortable" id="tabelrekapitulasi">
    <div class="box span12">
        <div class="box-header well" data-original-title="">
            <h2><i class="icon-th"></i> Tabel Rekapitulasi</h2>
            <div class="box-icon">
                <!--<a href="#" class="btn buttonPrint"><i class="icon-print"></i></a>-->
            </div>
        </div>
        <div class="box-content">
            <div id="formTabelRekap"></div>
        </div>
    </div><!--/span-->
</div>
