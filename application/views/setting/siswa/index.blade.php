@section('custom_script')
    <script type="text/javascript">
        jQuery(document).ready(function(){
            /**
             * Global variable
             */
            var tahunajaran_id;
            var rombel_id;
            var tahunawal;
            var tahunakhir;
            /**
             * set tahun ajaran aktif
             */
            jQuery('.tahun option:selected').css('background-color','green');
            jQuery('.tahun option:selected').css('color','white');
            /**
             * Set to not selected
             */
            jQuery('.rombellanjut').val([]);
            /**
             * tampilkan data siswa
             * buttonTampil click event
             */
            jQuery('#buttonTampil').click(function(){
                //set variabel
                tahunajaran_id = jQuery('select[name=datatahunajaran]').attr('value');
                rombel_id = jQuery('select[name=datarombel]').attr('value');
                
                if(tahunajaran_id == '' || rombel_id == ''){
                    showMessage('PERINGATAN','Lengkapi data yang kosong');
                }else{
                    //set ajax
                    jQuery.ajaxSetup ({cache: false});  
                    
                    if (rombel_id == 'all'){
                        //tampilkan data semua siswa
                        var loadUrl = "{{ URL::to('setting/siswa/ajxsiswa') }}" + "/" + tahunajaran_id + "/" + rombel_id;  
                    }else{
                        //tampilkan tabel siswa
                        var loadUrl = "{{ URL::to('setting/siswa/ajxsiswa') }}" + "/" + tahunajaran_id + "/" + rombel_id;  
                    }
                    
                    //tampilkan data siswa ke table
                    jQuery('#tabelsiswa').load(loadUrl,function(){
                        //datatable siswa        
                        $('.tablesiswa').dataTable({
                                        "sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span12'i><'span12 center'p>>",
                                        "sPaginationType": "bootstrap",
                                        "iDisplayLength": 50,
                                        "aLengthMenu": [[ 50, 100, -1], [ 50, 100, "All"]],
                                        "oLanguage": {
                                        "sLengthMenu": "_MENU_ records per page"
                                        }
                                } );
                    });
                }
            });
             /**
              * empty data siswa ketika select tahunajaran dan select rombel diganti/change
              */
              jQuery('select[name=datatahunajaran],select[name=datarombel]').change(function(){
                jQuery('#tabelsiswa').empty();                
              });
              /**
               * Cetak data siswa
               */
              jQuery('.btn-cetak').click(function(){
                    var tahunajaranId = jQuery('select[name=datatahunajaran]').val();
                    var rombelId = jQuery('select[name=datarombel]').val();
                    var printUrl = "{{ URL::to('setting/siswa/printtopdf') }}" + "/" + tahunajaranId + "/" + rombelId;
                    window.location.href = printUrl;
              });
           
        });
    </script>
@endsection
<!--                        <div>
				<ul class="breadcrumb">
					<li>
						<a href="{{ URL::to('home') }}">Home</a> <span class="divider">/</span>
					</li>
					<li>
						<a href="#">Siswa</a>
					</li>
				</ul>
			</div>-->
			
			<div class="row-fluid sortable">
				<div class="box span12">
					<div class="box-header well" data-original-title>
						<h2><i class="icon icon-darkgray icon-contacts"></i> Siswa</h2>
						<div class="box-icon">
                                                    <!--<a href="#" class="btn btn-setting btn-round"><i class="icon icon-darkgray icon-help"></i></a>-->
                                                </div>
					</div>
					<div class="box-content">
                                            <div class="row-fluid">
                                                <div class="span8">
                                                    <fieldset>
                                                        <legend>Data Siswa</legend>
                                                    </fieldset>
                                                </div>
                                                <div class="span4">
                                                    <a href="{{ URL::To('setting/siswa/new') }}" class="btn btn-primary pull-right"><i class="icon-white icon-plus"></i> Tambah</a>
                                                </div>
                                                <br/>
                                                <br/>
                                                <table class="form table-striped">
                                                    <tbody>
                                                        <tr>
                                                            <td>Tahun Ajaran</td>
                                                            <td>{{ \Laravel\Form::select('datatahunajaran', $selectTahunAjaran,(isset($tahunaktif) ? $tahunaktif->id : null),array('class'=>'input-medium tahun')) }}</td>
                                                            <td>Rombongan Belajar</td>
                                                            <td>{{ \Laravel\Form::select('datarombel', $rombelselect) }}</td>
                                                            <td>
                                                                <a href="#" id="buttonTampil" class="btn btn-primary">Tampilkan</a>
                                                                <a href="#" class="btn btn-success btn-cetak">Cetak</a>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>

                                                <br/>
                                                <br/>

                                                <div id="tabelsiswa"></div>
                                            </div>
                                            
                                            
                                            
					</div>
				</div><!--/span-->

			</div><!--/row-->
                        
                        <style type="text/css">
                            table.form td{
                                border: none;
                                padding: 5px;
                            }
                            table.form select{
                                margin: 0;
                            }
                        </style>


			
			
			
