htmlpage Customer_Invoice_Template(invIDstr, print)
displayname = "Customer Invoice Template"
content
<%{
if ((input.invIDstr  !=  null)  &&  (input.invIDstr  !=  ""))
{
	invID = input.invIDstr.toLong();
	supInv  =  Customer_Invoice  [ID == invID];
	thisapp.invoice.calBalance(supInv);
	waterMarkText = if (supInv.Remaining_Amount <= 0.0,"Paid in Full","");
	waterMarkColor = if (supInv.Remaining_Amount <= 0.0,"lightgreen","");
//thisapp.proposal.updateTotal(proposal);
//vendor = Vendor_List [ID == supInv.Vendor];
client  =  Contacts  [ID == supInv.Vendor];
comp  =  Company  [ID == client.Company];
coop  =  Cooper_Information  [ID != 0];
payDue  =  Payment_Due  [Customer_Invoice == supInv.ID];
printUrl = "https://creatorexport.zoho.com" + zoho.appuri + "print/Customer_Invoice_Template/&invIDstr=";
downloadUrl = "https://creatorexport.zoho.com" + zoho.appuri +"pdf/Customer_Invoice_Template/&invIDstr=";%>        
<style>
	<%=thisapp.styles.bootstrap()%>
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
	table { page-break-inside:auto }
	tr    { page-break-inside:avoid; page-break-after:auto }
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

	#bg-text
	{
		color:<%=waterMarkColor%>;
		font-size:120px !important;
		transform:rotate(-45deg);
		-webkit-transform:rotate(-45deg);
	}
</style>
<div class="container" >
	<div id="wmbg">
		<p id="bg-text"><%=waterMarkText%></p>
	</div>
	<%if (input.print  !=  "true")
	{%>            
	<div class="row" align="center" style="max-height:100px;">
		<ul class="pagination">
			<li>
				<a target="_blank" href="#Form:Customer_Invoice?zc_Header=false&recLinkID=<%=invID%>&viewLinkName=Supplier_Invoice_Report"><span>Edit Invoice</span></a>
			</li>
			<li>
				<a target="_blank" href="<%=printUrl+invIDstr%>&print=true">.<img src="/appcreator/live/01/images/print.png"/>.</a>
			</li>
			<li>
				<a target="_blank" href="<%=downloadUrl+invIDstr%>&print=true">Download</a>
			</li>
			<li>
				<a href="#Form:Customer_Invoice?Add_Payments=true&zc_LoadIn=dialog&zc_Header=false&recLinkID=<%=invID%>&viewLinkName=Payment_Terms"><span>Payment Setup</span></a>
			</li>
		</ul>
	</div>        <%}%> 
	<div class="row">
		<div class="panel" >
			<div class="panel-body">
				<div class="row" style="margin-top: 15px;margin-bottom: 15px;">
					<div class="col-xs-5">
						<div class="col-xs-4">
							<div class="media" style="margin-bottom:10px;">
								<img style="width: 100px;" class="media-object img-responsive" src="https://creator.zoho.com/DownloadLogo.do?sharedBy=29617547&amp;filepath=/1395701663975_upload__32d51d07_144f4bb0fd3__7bf9_00000341.tmp">	
							</div>
						</div>
						<div class="col-xs-8">
							<div class="media-body">			
								<table style="font-size: 11px !important;font-family: Calibri; padding-left:5px;">
									<tbody>
										<tr>
											<td colspan="2">
												Cooper Contracting
											</td>
										</tr>
										<tr>
											<td colspan="2">
												424 West Broadway Suite 3<br>
												New York, New York 10012
											</td>
										</tr>
										<tr>
											<th style="white-space: nowrap;">
												DCA License :
											</th>
											<td style="padding-left:5px;white-space: nowrap;">
												DCA 1012848
											</td>
										</tr>
										<tr>
											<th style="white-space: nowrap;">
												DOB Tracking :
											</th>
											<td style="padding-left:5px;white-space: nowrap;">
												613019
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="col-xs-2" align="center">
						<h3 style="-webkit-transform: rotate(-45deg);color:red;font-size: 24px !important;"> Invoice </h3>
					</div>
					<div class="col-xs-5">
						<div class="col-xs-4">
							<div class="media" style="margin-bottom:10px;"><%if (comp.Logo  !=  null)
								{%><%=thisapp.image.getImgHtmlContacts(comp)%>        <%}%>        </div>
							</div>
							<div class="col-xs-8">
								<div class="media-body">			
									<table style="font-size: 11px !important;font-family: Calibri; padding-left:5px;">
										<tbody><%vendorName = thisapp.nullFix.strToStr(comp.Company_Name);
											if (vendorName  !=  "")
											{%> 
											<tr>
												<td colspan="2">
													<%=thisapp.nullFix.strToStr(client.First_Name)%> <%=thisapp.nullFix.strToStr(client.Last_Name)%><br>
													<%=vendorName%>
												</td>
											</tr>        <%}%>  
											<tr>
												<td colspan="2">
													<%=thisapp.nullFix.strToStr(comp.Address)%><br><%cityName = thisapp.nullFix.strToStr(comp.City);
														if (cityName  !=  "")
														{
														cityName = cityName + " , ";
													}%><%=cityName%>
													<%=thisapp.nullFix.strToStr(comp.Zip_Code)%>
												</td>
											</tr><%if (vendorName  ==  "")
											{%>
											<tr>
												<td><%=thisapp.nullFix.strToStr(client.First_Name)%> <%=thisapp.nullFix.strToStr(client.Last_Name)%></td>
											</tr><%}%> 
											<tr>
												<th style="white-space: nowrap;">
													Invoice # :
												</th>
												<td style="padding-left:5px;white-space: nowrap;">
													<%=supInv.Invoice_Number%>
												</td>
											</tr>
											<tr>
												<th style="white-space: nowrap;">
													Submitted :
												</th>
												<td style="padding-left:5px;white-space: nowrap;">
													<%=thisapp.nullFix.dateToStr(supInv.Invoice_Date)%>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row ">
					<div class="col-xs-12" >
						<table class="table" style="border-radius: 4px 4px 0 0;font-size: 11px !important; font-family: Calibri;">
							<thead>
								<tr class="trHeader" style="background-color: #C6CEE7;">
									<th style="text-align:left;" >Deliverables</th> 
									<th style="text-align:right;" >Description</th> 
									<th style="text-align:right;">Notes</th>
									<th style="text-align:right;">Amount</th>
									<th style="text-align:right;">Rate</th>
									<th style="text-align:right;">Charge</th>
								</tr>
							</thead>
							<tbody><%=thisapp.pages.invoiceLineItems(Customer_Invoice[ID==invID])%></tbody>
						</table>
					</div>
				</div><%if (input.print  !=  "true")
					{
						if(zoho.loginuserid == zoho.adminuserid)
					{%>  
				<div class="row" style ="margin-top:20px;">
					<div class="col-xs-2 col-xs-offset-10">
						<ul style="background:none;border:none;box-shadow:none;display:block;float: right;">
						<li class='btn btn-default btn-sm'><a href="#Form:Supplier_Invoice?zc_Header=false&zc_LoadIn=dialog&recLinkID=<%=invID%>&viewLinkName=Supplier_Invoice_Report"><span>Edit Amount</span></a></li>
						</ul> 
					</div>
						</div>        <%}}%>
				<div class="row" style ="margin-top:10px;">
					<div class="col-xs-12" >
						<table class="table text-center" style="border-radius: 4px 4px 0 0;font-size: 11px !important; font-family: Calibri;">
							<tr><td></td></tr>
							<tr style="border-top:1px solid!important;border-bottom:1px solid!important;">
								<th colspan="4" style="text-align:left;width: 80%;"><span style="float:left;">Insurance</span></th>
								<td><span style="float:right;"><%=thisapp.nullFix.floatToStr(supInv.Insurance)%> %</span></td>
								<td><span style="float:right;">$ <%=thisapp.nullFix.currencyToStr(supInv.Insurance_Amount)%></span></td>
							</tr>
							<tr><td>&nbsp</td></tr>
							<tr style="border-top:1px solid!important;border-bottom:1px solid!important;">
								<th  colspan="4" style="text-align:left;width: 80%;"><span style="float:left;">General Conditions</span></th>
								<td><span style="float:right;"><%=thisapp.nullFix.floatToStr(supInv.General_Conditions)%> %</span> </td>
								<td><span style="float:right;">$ <%=thisapp.nullFix.currencyToStr(supInv.General_Conditions_Amount)%></span></td>
							</tr>
							<tr><td>&nbsp</td></tr>
							<tr style="border-top:1px solid!important;border-bottom:1px solid!important;">
								<th  colspan="4" style="text-align:left;width: 80%;"><span style="float:left;">Contractor Markup</span></th>
								<td><span style="float:right;"><%=thisapp.nullFix.floatToStr(supInv.General_Contractor_Markup)%> %</span></td>
								<td><span style="float:right;">$ <%=thisapp.nullFix.currencyToStr(supInv.General_Contractor_Markup_Amount.round(2))%></span></td>
							</tr>
							<tr><td>&nbsp</td></tr><%negDisc = thisapp.nullFix.currencyToStr(supInv.Negotiated_Discount);
							if (negDisc  !=  "0.00")
							{%> 
							<tr style="border-top:1px solid!important;border-bottom:1px solid!important;">
								<th  colspan="5" style="text-align:left;"><span style="float:left;">Negotiated Discount</span></th>
								<td><span style="float:right;">$ <%=negDisc%></span></td>
							</tr>
							<tr><td>&nbsp</td></tr>        
							<%}%>
							<tr style="border-top:1px solid!important;border-bottom:1px solid!important;">
								<th  colspan="4" style="text-align:left;width: 80%;"><span style="float:left;">NYS Sales Tax @8.875%</span></th>
								<td><span style="float:right;"><%=thisapp.nullFix.floatToStrIgnoreDec(supInv.NYS_Sales_Tax)%> %</span></td>
								<td><span style="float:right;">$ <%=thisapp.nullFix.currencyToStr(supInv.NYS_Sales_Tax_8_875_Amount)%></span></td>
							</tr>
							<tr><td>&nbsp</td></tr>
								<tr style="border-top:1px solid!important;border-bottom:1px solid!important;">
								<th  colspan="5" style="text-align:left;"><span style="float:left;">Grand Total</span></th>
								<td><span style="float:right;">$ <%=thisapp.nullFix.currencyToStr(supInv.Grand_Total)%></span></td>
							</tr>
							<tr><td colspan="6">&nbsp</td></tr><%for each payment in Payment_Due  [Customer_Invoice == invID] sort by  Status desc
							{
							if (payment.Status  ==  "Paid")
							{%>      
					        <tr style="border-bottom: 5px solid white;" >                
								<td>&nbsp</td>
									<th><span style="float:center;"><%=ifnull(payment.Title,"Deposit Due")%>&nbsp;<%=payment.Due_Date.	toDate()%> </span></th>
									<td>&nbsp</td>
									<th class="trGreen"><span style="float:center;"><%=payment.Status%> </span></th>      <%}
							if (payment.Status  !=  "Paid")
							{%>
							<tr style="border-bottom: 5px solid white;" >   
								<td>&nbsp</td>
								<th><span style="float:center;"><%=ifnull(payment.Title,"Deposit Due")%>&nbsp;<%=payment.Due_Date.toDate()%> </span></th>
								<td>&nbsp</td>
								<th class="trRed"><span style="float:center;" ><%=payment.Status%> </span></th>            <%}%>  
								<td>&nbsp</td>
								<td><span style="float:right;">$ <%=thisapp.nullFix.currencyToStr(payment.Due_Amount.round(2)%> </span></td>
							</tr> 
							<%}
							for each recPayment in Receive_Payments  [((Related_Due_Record is null) && Invoice == invID)] sort by  Date_Received 
							{%>
							<tr style="border-bottom: 5px solid white;" >   
								<td>&nbsp</td>
								<th><span style="float:center;">Payment received on &nbsp;<%=recPayment.Date_Received.toDate()%> </span></th>
								<td>&nbsp</td>
								<th class="trGreen"><span style="float:center;" >Paid </span></th>           <td>&nbsp</td>
								<td><span style="float:right;">$ <%=thisapp.nullFix.currencyToStr(recPayment.Actual_Amount_Received.round(2)%> </span></td>
							</tr>        <%}%> 
							<tr><td>&nbsp</td></tr>
							<tr style="border-top:1px solid!important;">
								<th  colspan="5" style="text-align:left;"><span style="float:left;">Pro Forma & Remaining Balance</span></th>
								<th><span style="float:right;">$ <%=thisapp.nullFix.currencyToStr(supInv.Remaining_Amount.round(2))%></span></th>
							</tr>
						</table>
					</div>
				</div>
				<%if (Proposal_Notes[Supplier_Invoice == invID].count()  >  0)
					{%>
				<div class="row" style ="margin-top:10px;">
					<div class="panel col-xs-6 notes">
						<div class="panel-heading">
							<h4 class="text-center" style="font-family: Calibri;">Invoice Notes<%if (input.print  !=  "true")
							{%> <a style="margin-left:10px;-right:10px; text-decoration:none;" href="#Form:Proposal_Notes?zc_Header=false&zc_LoadIn=dialog&Supplier_Invoice=<%=invID%>"><img src='https://css.zohostatic.com/creator/live/images/add_value_plus_icon_orange.png' width='11px' height='11px' > Add New</a> <%}%></h4>
						</div>
						<div class="panel-body">
							<dl class="dl-horizontal text-overflow"><%for each invNotes in Proposal_Notes  [Supplier_Invoice == invID]
							{%> 
								<dt><%=invNotes.Note_Title%></dt>
								<dd><%=invNotes.Comments%></dd> 
							<%}%> 
							</dl> 
						</div>        
					</div>
				</div>        <%}%>       
			 </div>
		</div>
	</div>
</div>    
<%}
}%>