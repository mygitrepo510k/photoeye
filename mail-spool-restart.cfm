<cfscript>
sFactory = CreateObject("java", "coldfusion.server.ServiceFactory");
sFactory.mailSpoolService.stop();
sFactory.mailSpoolService.start();
</cfscript>﻿
Done with restart!