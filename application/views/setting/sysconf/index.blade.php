@section('custom_script')
    <script type="text/javascript">
        jQuery(document).ready(function(){   
            /**
             * Format uang on load
             */
            function formatRupiahOnLoad(){
                jQuery('.uang').each(function(){
                    formatRupiah(jQuery(this).attr('id'));
                });
            }
            formatRupiahOnLoad();
            /**
            * format rupiah di input uang
            */
            jQuery('.uang').on('focus',function(){
                unformatRupiah(jQuery(this).attr('id'));
            });
            jQuery('.uang').on('blur',function(){
                formatRupiah(jQuery(this).attr('id'));
            });
//            /**
//             * Update target pencapaian
//             */
//            jQuery('.buttonUpdate').click(function(){
//               var target_id = jQuery(this).attr('id');
//               var tahun_id = jQuery(this).attr('tahunid');
//               var jumlah = jQuery('input[name='+target_id+']').attr('value');
//               var unformat_jumlah = unformatRupiahVal(jumlah);
//               //update target with jquery post
//               jQuery.post("{{ URL::to('setting/sysconf/targetpencapaian') }}", {
//                    tahun_id: tahun_id,
//                    jumlah: unformat_jumlah
//                }).fail(function(data){
//                    alert('DATA GAGAL UNTUK DISIMPAN. PERIKSA KEMBALI.');
//                }).done(function(){
//                    alert('Data telah berhasil di update.');
//                    //location.reload();
//                });
//            });
//            /**
//             * TARGET PENCAPAIAN BULANAN
//             */
//             jQuery('.buttonSet').click(function(){
//                //tampilkan data pencapaian
//                var tahunajaran_id = jQuery('select[name=targetjenisbiaya]').attr('value');
//                var loadUrl = "{{ URL::to('setting/sysconf/ajaxtargetbulanan') }}" + "/" + tahunajaran_id;
//                jQuery('#formTargetBulanan').load(loadUrl,function(){
//                    formatRupiahOnLoad();
//                });
//             });
//             /**
//              * Select TargetJenisBiaya change
//              */
//             jQuery('select[name=targetjenisbiaya]').change(function(){
//                //clear formTarget 
//                jQuery('#formTargetBulanan').empty();
//             });
             /**
              * Restore database
              */
             jQuery('.btn-restore').click(function(){
                 var upload = jQuery('input[name=fileupload]').attr('value');
                 if (upload == ''){
                     alert('.:: Peringatan ::. Pilih file backup.');
                    return false;
                 }
             });
        });
    </script>
@endsection

<!--<div>
        <ul class="breadcrumb">
                <li>
                        <a href="{{ URL::to('home') }}">Home</a> <span class="divider">/</span>
                </li>
                <li>
                        <a href="#">System Setting</a>
                </li>
        </ul>
</div>-->

<div class="row-fluid sortable ui-sortable">
        <div class="box span12">
            <div class="box-header well" data-original-title="">
                <h2><i class="icon-cog"></i> System Setting</h2>
                <div class="box-icon">
                    <!--<a href="#" class="btn btn-setting btn-round"><i class="icon icon-darkgray icon-help"></i></a>-->
                </div>
            </div>
            <div class="box-content">
                <ul class="nav nav-tabs" id="myTab">
                        <li class="active"><a href="#global">Global Setting</a></li>
                        <li><a href="#backup">Data Backup</a></li>
                        <li><a href="#qrun">Query Runner</a></li>
                        <!--<li><a href="#iuran">Target Pencapaian Iuran Bulanan</a></li>-->
                        <!--<li><a href="#target">Target Pencapaian</a></li>-->
                </ul>
                <div id="myTabContent" class="tab-content">
                        <div class="tab-pane active" id="global">
                            <table class="table-striped">
                                <tbody>
                                    <tr>
                                        {{ \Laravel\Form::open(URL::to('setting/sysconf/cetaknota'), 'POST') }}
                                        <td>Cetak Nota Otomatis</td>
                                        <td>{{ \Laravel\Form::select('cetaknota', array('Y'=>'YA','N'=>'TIDAK'),$appset->cetaknota) }}</td>
                                        <td>{{ \Laravel\Form::submit('Update', array('class'=>'btn btn-primary')) }}</td>
                                        <td><i>jika dipilih, secara otomatis sistem akan mencetak nota setiap transaksi iuran yang dilakukan</i></td>
                                        {{ \Laravel\Form::close() }}
                                    </tr>
                                    <tr>
                                        {{ \Laravel\Form::open(URL::to('setting/sysconf/printeraddr'), 'POST') }}
                                        <td>Shared Printer Address</td>
                                        <td>{{ \Laravel\Form::text('printeraddr', $appset->printeraddr) }}</td>
                                        <td>{{ \Laravel\Form::submit('Update', array('class'=>'btn btn-primary')) }}</td>
                                        <td><i>alamat printer yang di share</i></td>
                                        {{ \Laravel\Form::close() }}
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="tab-pane" id="backup">
                            <fieldset>
                                <legend>Data Backup</legend>
                                <div class="alert alert-block ">
                                        <h4 class="alert-heading">PENTING!</h4>
                                        Lakukan backup data sesering mungkin, untuk menjaga keamanan data anda.
                                </div>
                                <a href="{{ URL::to('setting/sysconf/backupme') }}" class="btn btn-primary" >Klik untuk backup database</a>
                            </fieldset>
                            <br/>
                            <fieldset>
                                {{ \Laravel\Form::open_for_files(URL::to('setting/sysconf/restore'), 'POST') }}
                                <legend>Data Restore</legend>
                                Open file backup
                                <input class="input-file" name="fileupload" type="file">
                                {{ \Laravel\Form::button('Restore Database', array('class'=>'btn btn-primary btn-restore')) }}
                                {{ \Laravel\Form::close() }}
                            </fieldset>
                        </div>
                        <div class="tab-pane" id="qrun">
                            <fieldset>
                                <div class="alert alert-block ">
                                        <h4 class="alert-heading">PENTING!</h4>
                                        Hanya untuk melakukan query khusus, jangan diuji coba dengan isian sembarang.
                                </div>
                            </fieldset>
                            <br/>
                            <fieldset>
                                {{ \Laravel\Form::open(URL::to('setting/sysconf/queryrunner'), 'POST') }}
                                <?php echo \Laravel\Form::textarea('query',null,array('required','class'=>'span12')); ?>
                                <br/>
                                {{ \Laravel\Form::button('Run', array('class'=>'btn btn-primary')) }}
                                {{ \Laravel\Form::close() }}
                            </fieldset>
                        </div>
<!--                        <div class="tab-pane" id="iuran">
                            <fieldset>
                                <legend>Target Pencapaian Iuran Bulanan</legend>
                            </fieldset>
                            <div>
                                <?php echo \Laravel\Form::select('targetjenisbiaya', $selectjenisbiaya,null,array('style'=>'margin:0;')); ?>
                                <a href="#" class="btn btn-primary buttonSet"  >Set</a>
                            </div>
                            <br/>
                            <div class="span6" style="margin-left: 0;" id="formTargetBulanan" >
                            </div>
                        </div>-->
                </div>
                
            </div>
        </div><!--/span-->
</div>


<style type="text/css">
    table tr td{
        padding: 5px;
    }
    table tbody tr td select,table tbody tr td input{
        margin:0!important;
    }

    table tbody tr td{
        vertical-align: middle!important;
        /*border:thin solid red;*/
    }
    .uang{
        text-align: right;
    }

</style>