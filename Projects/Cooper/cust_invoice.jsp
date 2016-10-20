htmlpage Invoice_Interface(invoice_num, print)
displayname = "Invoice Interface"
content
<%{
    if ((input.invoice_num  !=  null)  &&  (input.invoice_num  !=  ""))
    {
        inv_num = input.invoice_num.toLong();
        invoice  =  Cleaning_Invoice  [Invoice_Number == inv_num];
        if (invoice.count()  >  0)
        {
            client  =  Contacts  [ID == invoice.Contact];
            comp  =  Company  [ID == client.Company];
            printUrl = "https://creatorexport.zoho.com" + zoho.appuri + "print/Invoice_Interface/&invoice_num=";
            downloadUrl = "https://creatorexport.zoho.com" + zoho.appuri + "pdf/Invoice_Interface/&invoice_num=";%>  <style>
				<%=thisapp.styles.all_css()%>
				.tdNoWrap{
				white-space: nowrap;
				}
				@media print {
				.tdNoWrap{
				white-space: nowrap;
				}
				*{
				font-size:9px !important;
				font-family:Calibri;
				-webkit-print-color-adjust:exact;
				}
				.trHeader{
				background-color : #C6CEE7 !important;
				-webkit-print-color-adjust:exact;
				}
				}
				.trRed{
				//background-color: red;
				color:red;
				font-weight:bold;

				}
				.trGreen{
				//background-color: green;
				color:green;
				font-weight:bold;

				}
				*{
				font-family:Calibri;
				-webkit-print-color-adjust:exact;
				}
				.table>thead>tr>th, .table>tbody>tr>th, .table>tfoot>tr>th, .table>thead>tr>td, .table>tbody>tr>td, .table>tfoot>tr>td {
				padding: 5px;
				line-height: 1;
				vertical-align: top;
				border :none;
				}
				.paid{
				float:center;
				color:green;
				}
				.progress{

				}
				.row {
				margin : auto;
				}
				a:hover, a:focus {
				color: #2a6496;
				text-decoration: none;
				}
				.list-group-item {
				display : list-item;
				border:none;
				}
				.list-group{
				list-style: decimal inside;
				margin-top: 10px;
				}
				table { page-break-after:auto }
				  tr    { page-break-inside:avoid; page-break-after:auto }
				  td    { page-break-inside:avoid; page-break-after:auto }
				  thead { display:table-header-group }
				.notes { page-break-inside:auto }
				.notes>dl{//page-break-inside:avoid; //page-break-after:auto }
				#wmbg{
				position: absolute;
				z-index: 0;
				background: transparent;
				display: block;
				min-height: 50%;
				min-width: 50%;
				margin: 25% 50% 25% 25%;
				}

				#content{
				position:absolute;
				z-index:1;
				}
			</style>
<div class="container" ><%if (input.print  !=  "true")
            {%>  
    <div class="row" align="center" style="max-height:100px;">
		<ul class="pagination">
			<li>
				<a target="_blank" href="#Form:Invoice?zc_Header=false&recLinkID=<%=invoice.ID%>&viewLinkName=Invoice_Report"><span>Edit Invoice</span></a>
			</li>
			<li>
				<a target="_blank" href="<%=printUrl+invoice_num%>&print=true">.<img src="/appcreator/live/01/images/print.png"/>.</a>
			</li>
			<li>
				<a target="_blank" href="<%=downloadUrl+invoice_num%>&print=true">Download</a>
			</li>
		</ul>
	</div>            <%}%> 
	<div class="row">
		<div class="panel" >
			<div class="panel-body">
				<div class="row" style="margin-top: 15px;margin-bottom: 15px;">
					<div class="col-xs-5">
						<div class="col-xs-3">
							<div class="media" style="margin-bottom:10px;">
							<img style="width: 80px;max-height:70px;" class="media-object img-responsive" src="http://www.cooperdevelopment.com/favicon.ico">	
							</div>
						</div>
						<div class="col-xs-9">
							<div class="media-body">			
								<table style="font-size: 11px !important;font-family: Calibri; padding-left:5px;">
									<tbody>
										<tr>
											<th colspan="2">
											Cooper Hospitality
											</th>
										</tr>
										<tr>
											<td colspan="2">
											424 West Broadway Suite 3<br>
											New York, New York 10012
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="col-xs-2" align="center">
						<h3 style="-webkit-transform: rotate(-45deg);color:red;font-size: 24px !important;"> Invoice <br> <%=invoice.Invoice_Number%></h3>
					</div>
					<div class="col-xs-5">
						<div class="col-xs-4">
							<div class="media" style="margin-bottom:10px;"><%if (comp.Logo  !=  null)
            				{%><%=thisapp.image.getImgHtmlContacts(comp)%>            <%}%>            </div>
						</div>
						<div class="col-xs-8">
							<div class="media-body">			
								<table style="font-size: 11px !important;font-family: Calibri; padding-left:5px;">
									<tbody><%company_name = ifnull(comp.Company_Name,"");
								            cFName = ifnull(client.First_Name,"");
								            cLName = ifnull(client.Last_Name,"");
								            compAddress = ifnull(comp.Address,"");
								            cityName = ifnull(comp.City,"");
								            zipCode = ifnull(comp.Zip_Code,"");
								            if (company_name  !=  "")
								            {%>
								        <tr>
											<td colspan="2">
											<%=cFName%>
											<%=cLName%>
											<br>
											<%=company_name%>
											</td>
										</tr>            <%}%>  
										<tr>
											<td colspan="2">
											<%=compAddress%>
											<br><%if (cityName  !=  "")
									            {
									                cityName = cityName + " , ";
									            }%><%=cityName%>
											<%=zipCode%>
											</td>
										</tr><%if (company_name  ==  "")
            {%>                			<tr>
											<td>
											<%=cFName%>
											<%=cLName%>
											</td>
										</tr>            <%}%> 
										<tr>
											<th style="white-space: nowrap;">
											Invoice # :
											</th>
											<td style="padding-left:5px;white-space: nowrap;">
											<%=invoice.Invoice_Number%>
											</td>
										</tr>
										<tr>
											<th style="white-space: nowrap;">
											Submitted :
											</th>
											<td style="padding-left:5px;white-space: nowrap;">
											<%=invoice.Invoice_Date%>
											</td>
										</tr>
										<tr>
											<th colspan="2" >
											&nbsp;
											</th>
										</tr>
										<tr>
											<th colspan="2" style="white-space: nowrap;">
											<%=ifnull(invoice.Project_Database.Job_Name,"")%> - <%=ifnull(invoice.Project_Database.Cleaning_Rate,0.0)%>
											</th>
											
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<div class="row ">
					<div class="col-xs-12" >
						<table class="table" style="border-radius: 4px 4px 0 0;font-size: 11px !important; font-family: Calibri;">
							<thead>
								<tr class="trHeader" style="background-color: #C6CEE7;">
									<th style="text-align:right;">Team Member</th> 
									<th style="text-align:right;">Time in</th> 
									<th style="text-align:right;">Time out</th> 
									<th style="text-align:right;">Hours</th>
									<th style="text-align:right;">Amount</th>
								</tr>
							</thead>
							<tbody><%ets_line_list = Emp_Time_Sheet_Line[Invoice = invoice.ID].distinct(Employee_Time_Sheet);
            pay_day = Emp_Time_Sheet_Line[Invoice = invoice.ID].distinct(Check_in_Time);
            pay_day = pay_day.sort();
            for each day in pay_day
            {%>                <tr>
									<th style='text-align:left;' colspan='3' ><%=thisapp.nullFix.beautify_date(day)%></th>
								</tr><%day_subtot = 0.0;
                for each timesheet in Emp_Time_Sheet_Line  [(Invoice = invoice.ID && Check_in_Time = day)] sort by  Check_in_Time 
                {
                    project  =  Project_Database  [ID == timesheet.Project];
                    tot_Amount = (ifnull(timesheet.Hours,0.0)  *  ifnull(project.Cleaning_Rate,0.0)).round(2);
                    day_subtot = (day_subtot  +  tot_Amount).round(2);
                    ets_mem  =  Employee_Time_Sheet  [ID == timesheet.Employee_Time_Sheet];%> 
                                <tr>
									<td style="text-align:right;"><%=ets_mem.Team_Member.First_Name%> <%=ets_mem.Team_Member.Last_Name%></td>
									<td style="text-align:right;"><%=timesheet.Check_in_String%></td>
									<td style="text-align:right;"><%=timesheet.Check_out_String%></td>
									<td style="text-align:right;"><%=timesheet.Hours%></td>
									<td style="text-align:right;"><%=tot_Amount%></td>
								</tr>                <%}%> 
								<tr style="border-top:1px solid!important;border-bottom:1px solid!important;">
									<th  style="text-align:right;" colspan="4" style="text-align:left;">
									<span style="float:right;">Subtotal</span>
									</th>
									<td style="text-align:right;">
									<span style="float:right;">$ <%=day_subtot%>
									</span>
									</td>
								</tr>            <%}%>
							</tbody>
						</table>
					</div>
				</div>
				<div class="row" style ="margin-top:10px;">
					<div class="col-xs-12" >
						<table class="table text-center" style="border-radius: 4px 4px 0 0;font-size: 11px !important; font-family: Calibri;">
							<tr>
								<td>
								</td>
							</tr>
							<tr style="border-top:1px solid!important;border-bottom:1px solid!important;">
								<th  colspan="7" style="text-align:left;">
								<span style="float:left;">Total Hours</span>
								</th>
								<td>
								<span style="float:right;"><%=invoice.Total_Hours.round(2)%>
								</span>
								</td>
							</tr>
							<tr>
								<td>
								</td>
							</tr>
							<tr style="border-top:1px solid!important;border-bottom:1px solid!important;">
								<th  colspan="7" style="text-align:left;">
								<span style="float:left;">Total Amount</span>
								</th>
								<td>
								<span style="float:right;">$ <%=invoice.Total_Amount%>
								</span>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>	
</div>        <%}
    }
}%>
