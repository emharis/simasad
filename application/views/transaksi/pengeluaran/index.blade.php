@section('custom_script')
    <script type="text/javascript">
        jQuery(document).ready(function(){
            /**
             * Global Variables
             */
            var biaya;
            var ketBiaya;
            var detilTrans=[];
            var rowDetilTrans=1;
            var total=0;
            /**
             * Hide formBayar dan formKetetapan
             */
            jQuery('#formKetBiaya').hide();
            jQuery('#formBayar').hide();
            /**
             * set to not selected
             */
            jQuery('#selectBiaya').val([]);
            /**
             * jadikan tahun ajaran aktif menjadi berwarna hijau
             */
            jQuery('#selectTahun option:selected').css('background-color','green');
            jQuery('#selectTahun option:selected').css('color','white');
            /**
             * selectBiaya change event
             */
            jQuery('#selectBiaya').change(function(){
               var jenisbiayaid = jQuery(this).attr('value'); 
               var tahunajaranid = jQuery('#selectTahun').attr('value'); 
               //get tipe biaya
               jQuery.ajaxSetup ({cache: false});
                var getTipeBiayaUrl = "{{ URL::to('transaksi/pengeluaran/jsnGetBiaya') }}" + "/" + jenisbiayaid;
                jQuery.ajax({url:getTipeBiayaUrl,dataType:"json",async:false,success:function(data){
                      biaya = data;
                }});
                if(biaya.tipe == 'BTBI'){
                    //jika tipe BIAYA TETAP BUKAN IURAN, maka tampilkan formKetBiaya
                    jQuery('#formKetBiaya').show();
                    //ambil data ketetapanBiaya
                    jQuery.ajaxSetup ({cache: false});
                    var getKetBiayaUrl = "{{ URL::to('transaksi/pengeluaran/jsonketentuanbiaya') }}" + "/" + tahunajaranid + "/" + jenisbiayaid + "/BTBI";
                    jQuery.ajax({url:getKetBiayaUrl,dataType:"json",async:false,success:function(data){
                            ketBiaya = data;
                            //set ketetapan biaya ke text element
                            jQuery('#textKetBiaya').attr('value',formatRupiahVal(ketBiaya.jumlah));
                      }});
                    //sembunyikan formBayar
                    jQuery('#formBayar').hide();
                }else if(biaya.tipe == 'BBBI'){
                    //jika tipe BIAYA BEBAS BUKAN IURAN, maka tampilkan formBayar
                    jQuery('#formBayar').show();
                    //sembunyikan formBayar
                    jQuery('#formKetBiaya').hide();
                    //textBayar set to focus
                    jQuery('#textBayar').focus();
                }
            });
            /**
             * format rupiah di input uang
             */
            jQuery('.uang').on('focus',function(){
                unformatRupiah(jQuery(this).attr('id'));
            });
            jQuery('.uang').on('blur',function(){
                formatRupiah(jQuery(this).attr('id'));
            });
            /**
             * buttonInputBTBI click event 
             */
            jQuery('#buttonInputBTBI').click(function(e){
                e.preventDefault();
                //inputkan data transaksi
                var jumlah = unformatRupiahVal(jQuery('#textKetBiaya').attr('value'));
                //insert detil transaction
                addDetilTransaction(biaya,jumlah);
                
                return false;
            });
            /**
             * buttonInputBBBI click event
             */
            jQuery('#buttonInputBBBI').click(function(e){
                e.preventDefault();
                if (unformatRupiahVal(jQuery('#textBayar').attr('value')) != ''){
                    //inputkan data transaksi
                    var jumlah = unformatRupiahVal(jQuery('#textBayar').attr('value'));
                    var ket = jQuery('#textKeterangan').attr('value');
                    //insert detil transaction
                    addDetilTransaction(biaya,jumlah,ket);
                    //clear input
                    jQuery('#selectBiaya').val([]);
                    //hide formBayar
                    jQuery('#textBayar').removeAttr('value');
                    jQuery('#textKeterangan').removeAttr('value');
                    jQuery('#formBayar').hide();
                }else{
                    showMessage('PERINGATAN','Lengkapi data yang kosong.');
                }
                
                return false;
            });
            /**
             * function insert data transaksi
             */
            function addDetilTransaction(biayanya,jumlahnya,keterangan){
                //simpan kedalam array of json
                jsonDataTrans = {"biayaid":biayanya.id,"jumlah":jumlahnya,"keterangan":keterangan,"rownum":rowDetilTrans};
                detilTrans[detilTrans.length] = jsonDataTrans;
                //hitung total
                total = parseInt(total) + parseInt(jumlahnya);
                //tampilkan total ke element
                jQuery('#formTotal').text(formatRupiahVal(total));
                //masukkan detil transaksi ke dalam tabel element
                //create new row for table
                var newRow = "<tr id='row_" + rowDetilTrans + "' ><td>" + biayanya.nama + "</td><td>" + keterangan + "</td><td>" + formatRupiahVal(jumlahnya) + "</td><td><a tag='" + rowDetilTrans + "' href='#' class='btn btn-mini btn-warning linkDelete'>Delete</a></td></tr>";
                //insert new row to table
                jQuery('#tabelTransaksi').append(newRow);
                //rownum step up
                rowDetilTrans +=1;
            }
            /**
             * buttonBayar click event
             */
            jQuery('#buttonBayar').click(function(){
                if(detilTrans.length > 0){
                    var atJsonString = '{"detiltrans":[';
                    var endJsonString = ']}';
                    var dataTransJson = {"tahunajaranid":jQuery('#selectTahun').attr('value'),"arus":"M","tanggal":jQuery('#textTanggal').attr('value')};
                    var dataTransJsonString = JSON.stringify(dataTransJson);
                    
                    //create JSON String from array data transaksi (transArray)
                    for($i=0;$i<detilTrans.length;$i++){    
                        atJsonString = atJsonString + JSON.stringify(detilTrans[$i]);
                                                
                        //tambahkan koma setiap json 
                        if ($i < (detilTrans.length-1) ){
                            atJsonString = atJsonString + ',';
                        }
                    }
                    atJsonString = atJsonString + endJsonString;
                                        
                    $.post("{{ URL::to('transaksi/pengeluaran/inserttrans') }}", {
                        detiltrans: atJsonString,
                        datatrans: dataTransJsonString                        
                    }, function(data) {
                        alert('.:: INFORMASI ::. Data transaksi telah disimpan');
                        location.reload();
                    });
                }else{
                    showMessage('PERINGATAN','Data transaksi masih kosong.');
                } 
            });
            /**
             * linkDelete click evemt
             */
            jQuery('a.linkDelete').live('click',function(e){
                e.preventDefault();
                
                var rowNumForDel = jQuery(this).attr('tag');
                var totalForDel;
//                
//                //delete from array
//                for($i=0;$i<detilTrans.length;$i++){
//                    if(detilTrans[$i].rownum == rowNumForDel){
//                        totalForDel = detilTrans[$i].jumlah;
//                        detilTrans.splice($i,1);
//                        break;
//                    }
//                }
//                
//                //hapus row
//                var rowid = "#row_"+rowNumForDel;
//                jQuery(rowid).remove();
//                //rubah total
//                //hitung total
//                total = parseInt(total) - parseInt(totalForDel);
//                //tampilkan total ke element
//                jQuery('#formTotal').text(formatRupiahVal(total));
                
                
                detilTrans = $.grep(detilTrans, function (el, i) {
                    // do your normal code on el
                    if(el.rownum == rowNumForDel){
                        totalForDel = el.jumlah;
                        //hapus row
                        var rowid = "#row_"+rowNumForDel;
                        jQuery(rowid).remove();
                        //rubah total
                        //hitung total
                        total = parseInt(total) - parseInt(totalForDel);
                        //tampilkan total ke element
                        jQuery('#formTotal').text(formatRupiahVal(total));
                        
                        return false; //remove item
                    }

                    return true; // keep the element in the array
                });
                
                return false;
            });
            
        });
    </script>
@endsection

@section('custom_style')
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
@endsection

<!--                        <div>
				<ul class="breadcrumb">
					<li>
						<a href="{{ URL::to('home') }}">Home</a> <span class="divider">/</span>
					</li>
					<li>
						<a href="#">Transaksi Pengeluaran</a>
					</li>
				</ul>
			</div>-->

                        <div class="row-fluid sortable ui-sortable">
				<div class="box span12">
                                    <div class="box-header well" data-original-title="">
                                            <h2><i class="icon-share-alt"></i> Transaksi Pengeluaran</h2>
                                            <div class="box-icon">
                                                <!--<a href="#" class="btn btn-setting btn-round"><i class="icon icon-darkgray icon-help"></i></a>-->
                                            </div>
                                    </div>
                                    <div class="box-content">
                                        <div class="row-fluid">
                                            <div class="span8">
                                                {{ Form::open() }}
                                                <table>
                                                    <tbody>
                                                        <tr>
                                                            <td>Tahun Ajaran</td>
                                                            <td>{{ \Laravel\Form::select('tahunajaran', $tahunajaranselect,(isset($tahunaktif) ? $tahunaktif->id : null),array('id'=>'selectTahun')) }}</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Jenis Biaya</td>
                                                            <td>{{ \Laravel\Form::select('biaya', $biayaselect,null,array('id'=>'selectBiaya')) }}</td>
                                                            <td id="formKetBiaya">
                                                                <table>
                                                                    <tbody>
                                                                        <tr>
                                                                            <td>Biaya</td>
                                                                            <td>{{ \Laravel\Form::text('textKetBiaya', null,array('id'=>'textKetBiaya','readonly','class'=>'input-small uang','placeholder'=>'Rp. 0')) }}</td>
                                                                            <td><button class="btn btn-primary" id="buttonInputBTBI" ><i class="icon-white icon-plus"></i> Input</button></td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </td>
                                                            <td id="formBayar">
                                                                <table>
                                                                    <tbody>
                                                                        <tr>
                                                                            <td>Jumlah</td>
                                                                            <td>
                                                                                {{ \Laravel\Form::text('textBayar', null,array('id'=>'textBayar','class'=>'input-small uang','placeholder'=>'Rp. 0','autocomplete' => 'off')) }}
                                                                                {{ Laravel\Form::text('keterangan', null, array('id'=>'textKeterangan','class'=>'input-medium','autocomplete' => 'off')) }}
                                                                            </td>
                                                                            <td><button class="btn btn-primary" id="buttonInputBBBI" ><i class="icon-white icon-plus"></i> Input</button></td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                {{ Form::close() }}
                                            </div><!--span6-->
                                            <div class="span4">
                                                <div class="pull-right">
                                                    <table>
                                                        <tbody>
                                                            <tr>
                                                                <td>Tanggal</td>
                                                                <td>{{ \Laravel\Form::text(' tanggal', date('d-m-Y'), array('id'=>'textTanggal','class'=>'input-medium datepicker','style'=>'text-align:right')) }}</td>
                                                                <td rowspan="2">
                                                                    <button class="btn btn-primary" type="reset" id="buttonBayar" style="height: 100px;width: 100px;" >SIMPAN <i class="icon-white icon-chevron-right"></i></button>
                                                                </td>
                                                            </tr>
                                                            <tr style="font-size: x-large;">
                                                                <td>
                                                                    TOTAL
                                                                </td>
                                                                <td  style="text-align: right; color: white;">
                                                                        <p id="formTotal" style="background-color: orangered;padding: 10px; ">
                                                                            Rp. 0
                                                                        </>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div><!--span6-->
                                        </div> <!--row fluid-->
                                        <div class="row-fluid">
                                            <div>
                                                <table class="table table-bordered">
                                                    <colgroup>
                                                        <col/>
                                                        <col/>
                                                        <col/>
                                                        <col style="width: 12px;"/>
                                                    </colgroup>
                                                    <thead>
                                                        <tr style="background-color: #7FB93F;color: white;">
                                                            <th>Jenis Biaya</th>
                                                            <th>Keterangan</th>
                                                            <th>Sub Total</th>
                                                            <th>Opsi</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="tabelTransaksi">
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div><!--row-fluid-->
                                    </div>
                                </div><!--/span-->
                        </div>