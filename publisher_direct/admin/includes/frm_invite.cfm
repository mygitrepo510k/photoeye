<form action="invite_user.cfm" method="post">
	<div>
		<label>Firstname</label>
		<input type="text" value="" name="firstname" /><br />
		<label>Lastname</label>
		<input type="text" value="" name="lastname" /><br />		
		<label>Email</label>
		<input type="text" value="" name="email" />
	</div>
	<div>
		<label>Account type</label>
		<input type="radio" style="border:none;" name="service_level" value="ind" CHECKED /> individual
	</div>
	<div class="dented" style="margin-top:0;margin-bottom:0">
		<input type="radio" style="border:none;" name="service_level" value="bgt" /> individual-budget
	</div>
	<div class="dented" style="margin-top:0;margin-bottom:0">
		<input type="radio" style="border:none;" name="service_level" value="com" /> commercial
	</div>
	<div>
		<label>Books Approved</label>
		<input type="text" name="qty" value="1" maxlength="2" style="width:30px;text-align:right" />
	</div>
	<div>
		<label>&nbsp;</label>
		<input type="submit" value="send token" />
	</div>
</form>
