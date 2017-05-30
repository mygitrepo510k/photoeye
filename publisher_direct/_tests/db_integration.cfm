<cfquery name="qUpdate1" dataSource="photoeyecom">
			
			UPDATE STOCK 
			SET 
				Number = 'I1000     HB-SIGNED',
				Number_root = 'I1000',
				Number_binding = 'HB-SIGNED',
				Units = 1,
				Price1 = '50.00',
				Discont = 0
			WHERE substring(number,1,5) = 'I1000'
				AND autoID = 30675
				
			UPDATE PUBLISHER_DIRECT_BINDINGS
			SET
				Number = 'I1000     HB-SIGNED',
				Link = 'www.photoeye.com/api/'
			WHERE
				Number = 'I1000     HB-SIGNED'
		
		</cfquery>
	
		<cfquery name="qUpdate2" dataSource="photoeyecom">
			
			DELETE from STOCK 
			WHERE substring(number,1,5) = 'I1000'
				AND autoID = 30676
				
			DELETE from PUBLISHER_DIRECT_BINDINGS
			WHERE number = 'I1000     LTD-PRINT1'
				AND catalog = 'I1000'
		
		</cfquery>
	
		<cfquery name="qUpdate3" dataSource="photoeyecom">
			
				DELETE FROM inventory
				WHERE catalog = 'I1000'
				AND ltd_editio = 1
			
		</cfquery>
	
		<cfquery name="qUpdate4" dataSource="photoeyecom">
			
		UPDATE inventory
		SET
			hardbound = 1,
			hard_isbn = '',
			softbound = 0,
			soft_isbn = '',
			ltd_editio = 0,
			video = 0,
			title2 = 'ANOTHER GREAT DAY',
			title2x = 'Another Great Day',
			subtitle = '',
			subtitlex = '',
			authors = 'PHOTOGRAPHS BY ARTHUR TAYLOR, EDITED BY JOHN STRONG.',
			authorsx = 'Photographs by Arthur Taylor, Edited by John Strong.',
			publisher = 'SOMEBODY',
			publisherx = 'Somebody',
			city = 'SOMEWHERE',
			cityx = 'Somewhere',
			datepub = '2011',
			pages = '294',
			illustrat = '500 tritone plates',
			appendices = '',
			sizex = '12-1/2x12-3/4',
			categoryno = '',
			subject = 'PUBLISHER DIRECT',
			subjectx = 'DIRECT, PUBLISHER',
			ocr = 'ANOTHER GREAT DAY  PHOTOGRAPHS BY ARTHUR TAYLOR, EDITED BY JOHN STRONG. SOMEBODY LOREM IPSUM ETC...  MORE INFORMATION.... I1000H ',
			ocrx = 'Lorem ipsum etc...  More information....',
			hard_nyp = 0,
			hard_due = '',
			soft_nyp = 0,
			soft_due = '',
			country = '',
			language = ''
		WHERE catalog = 'I1000'
	
		</cfquery>