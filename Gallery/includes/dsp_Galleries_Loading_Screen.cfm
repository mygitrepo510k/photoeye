<div class="MALeft" id="LoadingScreen" style="text-align:center;">
	<img src="/global/images/loader2.gif" style="margin-top:200px;"/>
</div>

<script type="text/javascript">

function LoadingFunc() {
	$('LoadingScreen').hide();
	$('MainScreen').show();
	try{ 
		$('BreadCrumb').show();
	}
	catch(err){
		return false;
	}
	peLightbox.updateImageList();
	needs_padding();
	has_scrollbar();
}

</script>