public class Project_Reuest_cls {

    public static void main(List<Project_Request__c> ProjectRequest)
    {
        Messaging.SingleEmailMessage send_Mail = new Messaging.SingleEmailMessage();
       
        String html_template = '<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional //EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">'+
        '<html xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office">'+
        '<head>'+
          '<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">'+
          '<meta name="viewport" content="width=device-width, initial-scale=1.0">'+
          '<meta name="x-apple-disable-message-reformatting">'+
            '<style type="text/css">'+
        '@media only screen and (min-width: 620px) { .u-row {width: 600px !important;} .u-row .u-col { vertical-align: top; } .u-row .u-col-100 { width: 600px !important;}}'+
        
        '@media (max-width: 620px) { .u-row-container { max-width: 100% !important; padding-left: 0px !important; padding-right: 0px !important;}'+
          +'.u-row .u-col { min-width: 320px !important; max-width: 100% !important; display: block !important;}'
          +'.u-row {'+
            +'width: 100% !important;'
          +'}'+
         ' .u-col {'+
         '   width: 100% !important;'+
          '}'+
          '.u-col > div {'+
           ' margin: 0 auto;'+
          '}'+
        '}'+
        'body {'+
          'margin: 0;'+
          'padding: 0;'+
        '}'+
        'table,'+
        'tr,'+
        'td {'+
          'vertical-align: top;'+
      '    border-collapse: collapse;'+
        '}'+
        
       ' p {'+
        '  margin: 0;'+
        '}'+
        
'        .ie-container table,'+
'        .mso-container table {'+
'          table-layout: fixed;'+
        '}'+
        
'        * {'+
         ' line-height: inherit;'+
        '}'+
        
        'a[x-apple-data-detectors='+'true'+'] {'+
          'color: inherit !important;'+
'          text-decoration: none !important;'+
        '}'+
        
'        @media (max-width: 480px) {.hide-mobile {max-height: 0px;overflow: hidden;display: none !important;}}'+
        
'        table, td { color: #000000; } #u_body a { color: #f1c40f; text-decoration: underline; } @media (max-width: 480px) { #u_content_text_4 .v-container-padding-padding { padding: 60px 10px 10px !important; } #u_content_text_5 .v-container-padding-padding { padding: 60px 10px 10px !important; } #u_content_menu_1 .v-padding { padding: 5px 10px !important; } }</style>'          
+ '</head>'
    +
'        <body class="clean-body u_body" style="margin: 0;padding: 0;-webkit-text-size-adjust: 100%;background-color: #000325;color: #000000">'+
          '<table id="u_body" style="border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 320px;Margin: 0 auto;background-color: #000325;width:100%" cellpadding="0" cellspacing="0">'+
          '<tbody>'+
          '<tr style="vertical-align: top">'+
            '<td style="word-break: break-word;border-collapse: collapse !important;vertical-align: top">'+
          
        '<div class="u-row-container" style="padding: 0px;background-repeat: no-repeat;background-position: center top;background-color: transparent">'+
         ' <div class="u-row" style="margin: 0 auto;min-width: 320px;max-width: 600px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;">'+
            '<div style="border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;">'+
              
      '  <div class="u-col u-col-100" style="max-width: 320px;min-width: 600px;display: table-cell;vertical-align: top;">'+
       '   <div style="height: 100%;width: 100% !important;">'+
          
        '<table style="font-family:'+'Raleway'+',sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">'+
         ' <tbody>'+
            '<tr>'+
              '<td class="v-container-padding-padding" style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:'+'Raleway'+',sans-serif;" align="left">'+
'            <h1 style="margin: 0px; color: #f0e8e8; line-height: 140%; text-align: left; word-wrap: break-word; font-size: 22px; font-weight: 400;"><span><span><br />Project Request....</span></span></h1>'+
        
             ' </td>'+
            '</tr>'+
         ' </tbody>'+
        '</table>'+
        
'        <table id="u_content_text_4" style="font-family:'+'Raleway'+',sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">'+
         ' <tbody>'+
            '<tr>'+
            '  <td class="v-container-padding-padding" style="overflow-wrap:break-word;word-break:break-word;padding:60px 50px 33px;font-family:'+'Raleway'+',sans-serif;" align="left">'+
                
'          <div style="font-size: 14px; color: #ffffff; line-height: 140%; text-align: justify; word-wrap: break-word;">'+
            '<p style="line-height: 140%; font-size: 14px;"><span style="font-family: Raleway, sans-serif; font-size: 16px; line-height: 22.4px;"><strong>Hey BICS</strong></span></p>'+
        '<p style="line-height: 140%; font-size: 14px;"> </p>'+
        '<p style="line-height: 140%; font-size: 14px;"> </p>'+
        '<p style="line-height: 140%; font-size: 14px;"><span style="font-family: Raleway, sans-serif; font-size: 14px; line-height: 19.6px;"> {!Project_Request__c.Description__c} </span></p>'+
        '<p style="line-height: 140%; font-size: 14px;"> </p>'+
        '<p style="line-height: 140%; font-size: 14px;"><strong><span style="font-family: Raleway, sans-serif; font-size: 14px; line-height: 19.6px;">TONY</span></strong></p>'+
'        <p style="line-height: 140%; font-size: 14px;"><strong><span style="font-family: Raleway, sans-serif; font-size: 14px; line-height: 19.6px;">PROJECT LEAD</span></strong></p>'+
'        <p style="line-height: 140%; font-size: 14px;"> </p>'+
'          </div>'
+
'</td></tr></tbody></table></div></div></div></div></div>'+
'        <div class="u-row-container" style="padding: 0px;background-color: transparent">'+
'          <div class="u-row" style="margin: 0 auto;min-width: 320px;max-width: 600px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;">'+
'            <div style="border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;">'+
'        <div class="u-col u-col-100" style="max-width: 320px;min-width: 600px;display: table-cell;vertical-align: top;">'+
'          <div style="background-color: #1c132c;height: 100%;width: 100% !important;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;">'+
'        <table id="u_content_text_5" style="font-family:'+'Raleway'+',sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0"><tbody><tr>'+
'              <td class="v-container-padding-padding" style="overflow-wrap:break-word;word-break:break-word;padding:50px 80px 10px;font-family:'+'Raleway'+',sans-serif;" align="left">'+
'          <div style="font-size: 14px; color: #ffffff; line-height: 160%; text-align: center; word-wrap: break-word;">'+
'            <p style="font-size: 14px; line-height: 160%;">if you have any questions, please email us at <a rel="noopener" href="https://www.siva2122001+1@gmail.com" target="_blank">customer.success@unlayer.com</a> or visit our FAQS, you can also chat with a reel live human during our operating hours. They can answer questions about your account</p>'
+'</div>'+
'        </td></tr></tbody></table></td></tr></tbody></table></div></div></div></div></div></td></tr></tbody></table></body></html>;';


        projectsendmail__c email_data = projectsendmail__c.getInstance();
        EmailTemplate email_id = [select id, body from emailtemplate where name ='project'];
        List<Messaging.SingleEmailMessage> mailsent = new List<Messaging.SingleEmailMessage>();
        
        for (Project_Request__c Project_Data : ProjectRequest) 
        {
            // send_Mail.setTemplateId(email_id.id);
            // send_Mail.setTargetObjectId(Project_Data.id);
            send_Mail.setHtmlBody(html_template);
            send_Mail.setToAddresses(new String[] {email_data.Email__c});
            send_Mail.setSaveAsActivity(false);
            send_Mail.setUseSignature(false);
            mailsent.add(send_Mail);
        }

        Messaging.sendEmail(mailsent);
    }

}