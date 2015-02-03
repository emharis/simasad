@section('custom_script')
    <script type="text/javascript">
        jQuery(document).ready(function(){
            /**
             * Predefined Function/Statement
             * @type data|String
             */
            
            
            /**
             * set tahunajaran aktif
             */
            var tahunaktifid = "{{ $tahunaktif->id }}";
            jQuery('select[name=tahunajaran] option[value='+ tahunaktifid +']').css('color','white');
            jQuery('select[name=tahunajaran] option[value='+ tahunaktifid +']').css('background-color','green');
            
            /**
             * Tampilkan Data Mutasi
             */
            jQuery('.btn-tampil').click(function(){
                var tahunajaranId = jQuery('select[name=tahunajaran]').val();
                var getUrl = "{{ URL::to('transaksi/mutasi/listmutasi') }}" + "/" + tahunajaranId;
                jQuery('#tabel-mutasi').load(getUrl);
            });
            
        });
    </script>
@endsection

<div class="row-fluid sortable">
        <div class="box span12">
                <div class="box-header well" data-original-title>
                        <h2><i class="icon-th-large"></i> Mutasi</h2>
                        <div class="box-icon">
                            <!--<a href="#" class="btn btn-setting btn-round"><i class="icon icon-darkgray icon-help"></i></a>-->
                        </div>
                </div>
                <div class="box-content">
                    <div class="row-fluid">
                        <div class="span8">
                            <fieldset class="form-horizontal">
                                <div class="control-group">
                                    <label class="control-label">
                                        Tahun Ajaran
                                    </label>
                                    <div class="controls">
                                        <?php echo Laravel\Form::select('tahunajaran', $selecttahunajaran, $tahunaktif->id,array('class'=>'input-medium')); ?>
                                        <a class="btn btn-primary btn-tampil" >Tampilkan</a>
                                    </div>
                                </div>
                            </fieldset>
                        </div>
                        <div class="span4">
                            <a href="{{ URL::To('transaksi/mutasi/new') }}" class="btn btn-primary pull-right"><i class="icon-white icon-plus"></i> Tambah</a>
                        </div>
                        <br/>
                        <br/>
                        <div id="tabel-mutasi">
                            
                        </div>
                    </div>
                </div>
        </div><!--/span-->

</div><!--/row-->





