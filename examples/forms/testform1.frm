<form name="testform" method="post">
<input type="hidden" name="action" value="submit" />
<input type="text" name="username:limitedstring" required="true" value="<!-- username.value //-->" />
<!-- username.error //-->
<br />
<br />
<input type="password" name="password:limitedstring" required="true" value="<!-- password.value //-->" />
<!-- password.error //-->
<br />
<br />
<textarea name="textfield1:string" required="true"><!-- textfield1.value //--></textarea>
<!-- textfield1.error //-->
<br />
<br />
<select name="selectbox1:limitedstring">
  <!-- selectbox1.selected //-->
	<option value="audi">Audi</option>
	<option value="bmw">BMW</option>
	<option value="volvo">Volvo</option>
	<option value="dacia">Dacia</option>
	<option value="foobar">FooBar</option>
</select>
<!-- selectbox1.error //-->
<br />
<br />
<input type="submit" value="submit" />
</form>
