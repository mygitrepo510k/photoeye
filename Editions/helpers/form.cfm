<cfscript>
	
function insertTextField(attribute, value, instructions){
	instructions = replace(replace(instructions,"<","&lt;","ALL"),">","&gt;","ALL");
	return '
		<label>#replace(attribute,'_',' ')#</label>
		<input type="text" id="#attribute#" name="#attribute#" value="#value#" />
		<div class="instructions">#instructions#</div>
	';
}

function insertTextArea(attribute, value, instructions){
	instructions = replace(replace(instructions,"<","&lt;","ALL"),">","&gt;","ALL");
	return '
		<label>#replace(attribute,'_',' ')#</label>
		<div class="instructions">#instructions#</div>
		<textarea id="#attribute#" name="#attribute#">#value#</textarea>
	';
}

</cfscript>