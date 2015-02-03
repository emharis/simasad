<!--<div>
        <ul class="breadcrumb">
                <li>
                        <a href="{{ URL::to('home') }}">Home</a> <span class="divider">/</span>
                </li>
                <li>
                        <a href="{{ URL::to('setting/tahunajaran') }}">Tahun Ajaran</a> <span class="divider">/</span>
                </li>
                <li>
                        <a href="#">Edit Tahun Ajaran</a>
                </li>
        </ul>
</div>-->

<div class="row-fluid sortable">
        <div class="box span12">
                <div class="box-header well" data-original-title>
                        <h2><i class="icon-edit"></i> Edit Tahun Ajaran</h2>
                        <div class="box-icon">
                            <a href="#" class="btn btn-setting btn-round"><i class="icon icon-darkgray icon-help"></i></a>
                        </div>
                </div>
                <div class="box-content">
                    {{ Laravel\Form::open(URL::to('setting/tahunajaran/edit'), 'POST', array('class'=>'form-horizontal')) }}
                        <fieldset>
                                {{ Form::hidden('tahunajaran_id',$tahunajaran->id) }}
                              <div class="control-group">
                                <label class="control-label" for="typeahead">Nama</label>
                                <div class="controls">
                                      {{ Form::text('nama',$tahunajaran->nama,array('class'=>'span6 typeahead','required')) }}
                                </div>
                              </div>
                              <div class="control-group">
                                <label class="control-label" for="date01">Aktif</label>
                                <div class="controls">
                                    <?php $aktif = array('Y'=>'Aktif','N'=>'Non Aktif') ?>
                                    {{ Laravel\Form::select('aktif', $aktif,$tahunajaran->aktif) }}
                                </div>
                              </div>
<!--                                                              <div class="control-group">
                                <label class="control-label" for="fileInput">Masa KBM</label>
                                <div class="controls">
                                    {{ Form::text('awal',null,array('class'=>'input-medium datepicker','placeholder'=>'awal')) }}
                                    {{ Form::text('akhir',null,array('class'=>'input-medium datepicker','placeholder'=>'akhir')) }}
                                </div>
                              </div>-->
                              <div class="form-actions">
                                <button type="submit" class="btn btn-primary">Save changes</button>
                                <a href="{{ URL::to('setting/tahunajaran') }}" type="reset" class="btn">Cancel</a>
                              </div>
                        </fieldset>
                      {{ Form::close() }}
                </div>
        </div><!--/span-->

</div><!--/row-->





