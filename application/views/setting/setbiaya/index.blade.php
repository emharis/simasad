@section('custom_script')
    <script type="text/javascript">
        jQuery(document).ready(function(){
            //hidden tabel pengaturan biaya
            jQuery('#tabelPengaturan').hide();
            //posisikan ke not selected
            jQuery('#selectBiaya').val([]);
            //set tahun ajaran aktif
            jQuery('select[name=tahunajaran] option:selected').css('background-color','green');
            jQuery('select[name=tahunajaran] option:selected').css('color','white');
            var aktiftext = jQuery('select[name=tahunajaran] option:selected').text() + ' ( aktif )';
            jQuery('select[name=tahunajaran] option:selected').text(aktiftext);
            //set ke posisi not selected
            jQuery('#selectTahun').val([]);
            //buttonTampil click event
            jQuery('#buttonTampil').click(function(){
               var biaya_id = jQuery('#selectBiaya').attr('value');
               var tahunajaran_id = jQuery('#selectTahun').attr('value');
               
               if (biaya_id != '' && tahunajaran_id != ''){
                    //tampilkan tabel pengaturan biaya
                    jQuery.ajaxSetup ({cache: false});  
                    var loadUrl = "{{ URL::to('setting/setbiaya/ajaxpengaturan') }}"+"/"+tahunajaran_id+"/"+biaya_id;  
                    jQuery('#formKetentuan').load(loadUrl,null,function(){
                        //format rupiah
                        jQuery('.uang').each(function(){
                           var uang = jQuery(this).attr('value');
                               uang = jQuery.trim(uang);

                                 uang = formatRupiahVal(uang);
                                 jQuery(this).attr('value',uang);

                        });
                        
                        //format rupiah on focus dan on blur
                        jQuery('.uang').on('focus',function(){
                            unformatRupiah(jQuery(this).attr('id'));
                        });
                        jQuery('.uang').on('blur',function(){
                            formatRupiah(jQuery(this).attr('id'));
                        });
                    });
                    jQuery('#tabelPengaturan').show();
               }else{
                   //tampilkan pesan data kosong
                   showMessage('PERINGATAN','Lengkapi data yang kosong.');
               }
            });
            //selectTahunajaran change
            jQuery('#selectTahun').change(function(){
                jQuery('#tabelPengaturan').hide();
            });
            //selectBiaya change
            jQuery('#selectBiaya').change(function(){
                jQuery('#tabelPengaturan').hide();
            });
                
            
        })
    </script>
@endsection
<!--                        <div>
				<ul class="breadcrumb">
					<li>
						<a href="{{ URL::to('home') }}">Home</a> <span class="divider">/</span>
					</li>
					<li>
						<a href="#">Pengaturan Biaya</a>
					</li>
				</ul>
			</div>-->
			
			<div class="row-fluid sortable">
				<div class="box span12">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-list"></i> Pengaturan Biaya</h2>
						<div class="box-icon">
                                                    <!--<a href="#" class="btn btn-setting btn-round"><i class="icon icon-darkgray icon-help"></i></a>-->
                                                </div>
					</div>
					<div class="box-content">
                                            <fieldset class="form-horizontal">

                                                    <div class="control-group">
                                                        <label class="control-label" >Jenis Biaya</label>
                                                        <div class="controls">
                                                            {{Form::select('biaya',$biayaselect,null,array('id'=>'selectBiaya'))}}
                                                        </div>
                                                    </div>

                                                    <div class="control-group">
                                                        <label class="control-label" >Tahun Ajaran</label>
                                                        <div class="controls">
                                                            {{ Form::select('tahunajaran',$tahunselect,(isset($tahunaktif) ? $tahunaktif->id : null),array('id'=>'selectTahun')) }}
                                                            <!--untuk menampung hidden value jenjang-->
                                                            <div id="jenjang"></div>
                                                        </div>
                                                    </div>

                                                    <div id="formPerJenjang"></div>
                                                    <div id="formNonJenjang"></div>

                                                      <div class="form-actions">
                                                            <button id="buttonTampil" type="submit" class="btn btn-primary" >Tampilkan</button>
                                                            <button type="reset" class="btn" >Cancel</button>
                                                      </div>
                                                </fieldset>
					</div>
				</div><!--/span-->

			</div><!--/row-->
                        <div class="row-fluid sortable" id="tabelPengaturan">
				<div class="box span12">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-list"></i> Tabel Pengaturan Biaya</h2>
					</div>
                                        <div class="box-content">
                                            <fieldset class="form-horizontal" id="formKetentuan">
                                                
                                            </fieldset>
					</div>
				</div><!--/span-->

			</div><!--/row-->