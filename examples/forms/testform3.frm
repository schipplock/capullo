<form name="testform" method="post">
<input type="hidden" name="action" value="submit" />
User Name:<br />
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
<textarea name="textfield2:html" required="true"><!-- textfield2.value //--></textarea>
<!-- textfield2.error //-->
<br />
<br />
<select name="selectbox1:limitedstring" required="true">
<!-- selectbox1.selected //-->
<option value="selection1">Selection 1</option>
<option value="selection2">Selection 2</option>
</select>
<!-- selectbox1.error //-->
<br />
<br />
<select name="selectbox2:string" required="true">
  <!-- selectbox2.selected //-->
	<option value="<!-- selectbox2.dynamic.value //-->"><!-- selectbox2.dynamic.label //--></option>
</select>
<!-- selectbox2.error //-->
<br />
<br />
Radioboxes:<br />
<br />
<input type="radio" required="true" name="radiobox1:limitedstring" value="<!-- radiobox1.dynamic.value //-->" />&nbsp;<!-- radiobox1.dynamic.label //--><br />
<!-- radiobox1.error //-->
<br />
<br />
<input type="submit" value="submit" />
</form>
