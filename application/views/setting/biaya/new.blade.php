@section('custom_script')
<script type="text/javascript">
    jQuery(document).ready(function(){
        //hidden dulu ya form ketentuan biayanya
        jQuery('#formBiayaTetap').hide();
        jQuery('#formBiayaTetapPerjenjang').hide();
        //posisikan ke not selected
        jQuery('#selectJenisBiaya').val([]);
        jQuery('#selectArus').val([]);
        jQuery('#selectJenjang').val([]);
        /**
         * set not selected biaya
         */
        function setEmptySelect(){
            jQuery('.biaya').each(function(){
               jQuery(this).val([]); 
            });
        }
        setEmptySelect();
        /**
         * hide select element
         */
        jQuery('select[name=tetap]').hide();
        jQuery('select[name=iuran]').hide();
        jQuery('select[name=bulanan]').hide();
        jQuery('select[name=jenjang]').hide();
        /**
         * select arus selected
         */
        jQuery('select[name=arus]').change(function(){
           var arus = jQuery(this).attr('value') ;
           if (arus =='K'){
               jQuery('select[name=tetap]').hide();
               jQuery('select[name=iuran]').hide();
                jQuery('select[name=bulanan]').hide();
                jQuery('select[name=jenjang]').hide();
           }else{
               jQuery('select[name=tetap]').show(500);
           }
        });
        /**
         * select jenis selected
         */
        jQuery('select[name=tetap]').change(function(){
            //bersihkan dulu
            jQuery('select[name=iuran]').hide();
            jQuery('select[name=bulanan]').hide();
            jQuery('select[name=jenjang]').hide();
            jQuery('select[name=iuran]').val([]);
            jQuery('select[name=bulanan]').val([]);
            jQuery('select[name=jenjang]').val([]);
            
            var tetap = jQuery(this).attr('value');
            if (tetap == 'tetap'){
                jQuery('select[name=iuran]').show(500);
            }else{
                jQuery('select[name=iuran]').show(500);
            }
        });
        /**
         * select iuran selected
         */
        jQuery('select[name=iuran]').change(function(){
            //bersihkan dulu
            jQuery('select[name=bulanan]').hide();
            jQuery('select[name=jenjang]').hide();
            jQuery('select[name=bulanan]').val([]);
            jQuery('select[name=jenjang]').val([]);
            
            var iuran = jQuery(this).attr('value');
            if (iuran == 'iuran'){
                if(jQuery('select[name=tetap]').attr('value') == 'tetap'){
                    jQuery('select[name=bulanan]').show(500);
                    jQuery('select[name=jenjang]').show(500);
                }else{
                    //jQuery('select[name=bulanan]').show(500);
                }
            }else{
                
            }
        });
        
        //selectJenisBiaya change event
        jQuery('#selectJenisBiaya').change(function(){
            var jenisBiaya = jQuery(this).attr('value');
            var jenjang = jQuery('#selectJenjang').attr('value');
            
            if (jenisBiaya == 'ITB' || jenisBiaya == 'ITC' || jenisBiaya == 'BTBI'){
                if (jenjang == 'Y'){
                    jQuery('#formBiayaTetap').hide();
                    jQuery('#formBiayaTetapPerjenjang').fadeIn(150);
                }else{
                    jQuery('#formBiayaTetapPerjenjang').hide();
                    jQuery('#formBiayaTetap').fadeIn(150);
                }
            }else if (jenisBiaya == 'BBBI'){
                jQuery('#formBiayaTetap').hide();
        jQuery('#formBiayaTetapPerjenjang').hide();
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
                        <a href="{{ URL::to('setting/biaya/baru') }}">Biaya</a> <span class="divider">/</span>
                </li>
                <li>
                        <a href="#">Tambah</a>
                </li>
        </ul>
</div>-->

<div class="row-fluid sortable">
        <div class="box span12">
                <div class="box-header well" data-original-title>
                        <h2><i class="icon-list-alt"></i> Tambah Biaya</h2>
                        <div class="box-icon">
                            <!--<a href="#" class="btn btn-setting btn-round"><i class="icon icon-darkgray icon-help"></i></a>-->
                        </div>
                </div>
                <div class="box-content">
                    {{ Laravel\Form::open(null, 'POST', array('class'=>'form-horizontal')) }}
                    <fieldset>
                        <!--hidden value-->
                        <div class="control-group">
                            <label class="control-label" >Nama</label>
                            <div class="controls">
                                  {{ Form::text('nama',null,array('class'=>'input-large','required','id'=>'textNama','autocomplete' => 'off')) }}
                            </div>
                        </div>
                        <div class="control-group">
                                        <label class="control-label" >Arus Biaya</label>
                                        <div class="controls">
                                            <?php $arus = array('M'=>'Masuk','K'=>'Keluar') ?>
                                              {{ Form::select('arus',$arus,null,array('id'=>'selectArus','required'))}}
                                        </div>
                                    </div>
                        <div class="control-group">
                            <label class="control-label" >Jenis Biaya</label>
                            <div class="controls">
                                  <?php echo \Laravel\Form::select('tetap',array('tetap' => 'BIAYA TETAP','bebas' => 'BIAYA BEBAS'),null,array('class'=>'input-medium biaya')) ?>
                                  <?php echo \Laravel\Form::select('iuran',array('iuran' => 'IURAN','bukan' => 'BUKAN IURAN'),null,array('class'=>'input-medium biaya')) ?>
                                  <?php echo \Laravel\Form::select('bulanan',array('bulanan' => 'BULANAN','bukan' => 'BUKAN BULANAN'),null,array('class'=>'input-medium biaya')) ?>
                                  <?php echo \Laravel\Form::select('jenjang',array('beda' => 'BEDA TIAP JENJANG'),null,array('class'=>'input-large biaya')) ?>
                            </div>
                        </div>

                          <div class="form-actions">
                            <button type="submit" class="btn btn-primary">Save</button>
                            <a href="{{ URL::to('setting/biaya') }}" class="btn">Cancel</a>
                          </div>
                    </fieldset>
                  {{ Form::close() }}
                </div>
        </div><!--/span-->

</div><!--/row-->