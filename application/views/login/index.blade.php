<!DOCTYPE html>
<html lang="en">
    <head>
        <base href="<?php echo URL::base() ?>/">
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <title>.:SIMAS.ad:.</title>
        <meta name="description" content="Custom Login Form Styling with CSS3" />
        <meta name="keywords" content="css3, login, form, custom, input, submit, button, html5, placeholder" />
        <meta name="author" content="Codrops" />
        <link rel="shortcut icon" href="../favicon.ico"> 
        <link rel="stylesheet" type="text/css" href="css/login.style.css" />
        <script src="js/modernizr.custom.63321.js"></script>
        <!--[if lte IE 7]><style>.main{display:none;} .support-note .note-ie{display:block;}</style><![endif]-->
        <style>
                body {
                        background: #eedfcc url(img/blur1.jpg) no-repeat center top;
                        -webkit-background-size: cover;
                        -moz-background-size: cover;
                        background-size: cover;
                }
                .container > header h1,
			.container > header h2 {
				color: #fff;
				text-shadow: 0 1px 1px rgba(0,0,0,0.5);
			}
        </style>
    </head>
    <body>
        <div class="container">
			
			<header>
			
				<h1>SIMAS <strong>.ad</strong></h1>
				<h4>Sistem Administrasi Keuangan Sekolah</h4>
				<br/>
                               
			</header>
			
			<section class="main">
                                <form id="login" action="{{URL::to('login')}}" method="post" class="form-2">
					<h1><span class="log-in">Log in</span> to <span class="sign-up">SIMAS.ad</span></h1>
					<p class="float">
						<label for="login"><i class="icon-user"></i>Username</label>
                                                <input type="text" name="username" placeholder="Username or email" autocomplete="off" autofocus required >
					</p>
					<p class="float">
						<label for="password"><i class="icon-lock"></i>Password</label>
						<input type="password" name="password" placeholder="Password" class="showpassword">
					</p>
					<p class="clearfix"> 
                                            <a style="visibility: hidden;" href="#" class="log-twitter">Log in with Twitter</a>    
						<input type="submit" name="submit" value="Log in">
					</p>
				</form>
			</section>
			
        </div>
		<!-- jQuery if needed -->
        <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
		<script type="text/javascript">
			jQuery(document).ready(function(){
			    $(".showpassword").each(function(index,input) {
			        var $input = $(input);
			        $("<p class='opt'/>").append(
			            $("<input type='checkbox' class='showpasswordcheckbox' id='showPassword' />").click(function() {
			                var change = $(this).is(":checked") ? "text" : "password";
			                var rep = $("<input placeholder='Password' type='" + change + "' />")
			                    .attr("id", $input.attr("id"))
			                    .attr("name", $input.attr("name"))
			                    .attr('class', $input.attr('class'))
			                    .val($input.val())
			                    .insertBefore($input);
			                $input.remove();
			                $input = rep;
			             })
			        ).append($("<label for='showPassword'/>").text("Show password")).insertAfter($input.parent());
			    });

			    $('#showPassword').click(function(){
					if($("#showPassword").is(":checked")) {
						$('.icon-lock').addClass('icon-unlock');
						$('.icon-unlock').removeClass('icon-lock');    
					} else {
						$('.icon-unlock').addClass('icon-lock');
						$('.icon-lock').removeClass('icon-unlock');
					}
			    });
                            
                            /**
                             * Login with jquery.get
                             */
                            jQuery('input[name=submit]').click(function(e){
                                e.preventDefault();
                               var username = jQuery('input[name=username]').attr('value');
                               var password = jQuery('input[name=password]').attr('value');
                               
                               jQuery.post("{{ URL::to('login') }}", {
                                    username: username,
                                    password: password
                                }).done(function(){
                                    //masuk ke halamn utama
                                    location.href = "{{ URL::to('home') }}";
                                }).fail(function(){
                                    jQuery('.main').shake();
                                    jQuery('#login h1').empty();
                                    jQuery('#login h1').append('<span style="text-align:center;color:red;" class="sign-up">---Username/Password Not Valid---</span>');
                                    jQuery('input[name=username]').focus();
                                    jQuery('input[name=password]').removeAttr('value');
                                });
                               
                               return false;
                            });
                            
                            
                            /**
                             * Shake element
                             * @returns {jQuery.fn}
                             */
                            jQuery.fn.shake = function() {
                                    this.each(function(i) {
                                        $(this).css({ "position": "relative" });
                                        for (var x = 1; x <= 3; x++) {
                                            $(this).animate({ left: -25 }, 10).animate({ left: 0 }, 50).animate({ left: 25 }, 10).animate({ left: 0 }, 50);
                                        }
                                    });
                                    return this;
                                } 
                            
			});
		</script>
    </body>
</html>