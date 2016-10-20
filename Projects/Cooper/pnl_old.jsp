htmlpage P_and_L_Interface(year_str, project_ids, print)
displayname = "P and L Interface"
pdf = true
content
<%{
    if (input.year_str  ==  null)
    {
        year = zoho.currentdate.getYear();
    }
    else
    {
        year = input.year_str.toLong();
    }
    project_list = List:Int();
    if (((input.project_ids  !=  null)  &&  (input.project_ids  !=  "null"))  &&  (input.project_ids  !=  ""))
    {
        project_list_str = input.project_ids.toList();
        for each proj_str in project_list_str
        {
            if (proj_str  !=  "")
            {
                proj_id_temp = proj_str.toLong();
                project_list.add(proj_id_temp);
            }
        }
    }
    if (project_list.size()  ==  0)
    {
        project_list = (Project_Database[ID != 0].ID).getall();
    }
    base_url = "https://creator.zoho.com" + zoho.appuri;
    next_year = (year  +  1);
    st_date = ("01-Jan-" + year).toDate();
    end_date = ("01-Jan-" + next_year).toDate();
	 downloadUrl = zoho.appuri + "pdf/P_and_L_Interface/?year_str=";%>    <style>
	<%=thisapp.styles.all_css()%>
	btn{
text-shadow:none;
}
	.tdNoWrap{
	white-space: nowrap;
			}
	@media print {
		.tdNoWrap{
	white-space: nowrap;
		}
	*{
	font-size:9px !important;
	font-family:Calibri !important;
	-webkit-print-color-adjust:exact;
	}
	.trHeader{
		background-color : #C6CEE7 !important;
		-webkit-print-color-adjust:exact;
	}
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
	 .dl-horizontal dt {
			overflow : auto;
			white-space:normal;
			margin : 2px; 
		}
	table { page-break-inside:auto }
  	tr    { page-break-inside:avoid; page-break-after:auto }
	.notes { page-break-inside:auto }
	.notes>dl{#page-break-inside:avoid; #page-break-after:auto }<%if (thisapp.user.isCustomer())
    {%>        .hideCustomer{
	visibility: hidden;
	}    <%}%>    .row input~div{
	display:block;
}
.row input:checked~div{
	display:none;
}
@media print {
	#pnl_table{
font-size:65%;
}

}
</style>
<div class="container" >
	<%if (input.print  !=  "true")
        {%>            <div class="row" align="center" style="max-height:100px;">
            <ul class="pagination">
            <li>
                <a target="_blank" href="<%=downloadUrl+year + '&project_ids='+project_list_str%>&print=true"><i class="fa fa-download" aria-hidden="true"></i></a>
			</li>
        </ul>

    </div>        <%}%> 
  	<div class="row" >
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
					<div class="col-xs-7">
					<h3 style="color:#C6CEE7;font-size: 24px !important;font-weight:bolder;"> Income Statement for the year <%=year%></h3>
					</div>
  				</div>
				<div class="row " id="pnl_table" style="background-color: #C6CEE7;">
					<div class="col-xs-2" style="border-radius: 4px 4px 0 0;font-size: 11px !important; font-family: Calibri;margin-top: 6px;text-align:right;">
						<p><b>Account Name</b></p>
					</div>
					<div class="col-xs-8" style="border-radius: 4px 4px 0 0;font-size: 11px !important; font-family: Calibri;margin-top: 6px;text-align:right;">
						<div class="col-xs-1" >
							<p><b>Jan</b></p>
						</div>
						<div class="col-xs-1" >
							<p><b>Feb</b></p>
						</div>
						<div class="col-xs-1" >
							<p><b>Mar</b></p>
						</div>
						<div class="col-xs-1" >
							<p><b>Apr</b></p>
						</div>
						<div class="col-xs-1" >
							<p><b>May</b></p>
						</div>
						<div class="col-xs-1" >
							<p><b>Jun</b></p>
						</div>
						<div class="col-xs-1" >
							<p><b>Jul</b></p>
						</div>
						<div class="col-xs-1" >
							<p><b>Aug</b></p>
						</div>
						<div class="col-xs-1" >
							<p><b>Sep</b></p>
						</div>
						<div class="col-xs-1" >
							<p><b>Oct</b></p>
						</div>
						<div class="col-xs-1" >
							<p><b>Nov</b></p>
						</div>
						<div class="col-xs-1" >
							<p><b>Dec</b></p>
						</div>
					</div>
					<div class="col-xs-2" style="border-radius: 4px 4px 0 0;font-size: 11px !important; font-family: Calibri;margin-top: 6px;text-align:right;">
						<p><b>Total Amount</b></p>
					</div>
  				</div>
				<div class="row " id="pnl_table">
					<div class="col-xs-12" style="border-radius: 4px 4px 0 0;font-size: 11px !important; font-family: Calibri;">
						<p><b>Income</b></p>
					</div>
				</div><%income_total = 0.0;
    jan_tot = 0.0;
    feb_tot = 0.0;
    mar_tot = 0.0;
    apr_tot = 0.0;
    may_tot = 0.0;
    jun_tot = 0.0;
    jul_tot = 0.0;
    aug_tot = 0.0;
    sep_tot = 0.0;
    oct_tot = 0.0;
    nov_tot = 0.0;
    dec_tot = 0.0;
    for each income_acc in Chart_of_Accounts  [(Account_Number >= 4000 && Account_Number <= 4999)] sort by  Account_Number 
    {
        acc_transaction_income  =  Account_Transactions  [(((Account == income_acc.ID && Job_Database in project_list) && Added_Time >= st_date) && Added_Time <= end_date)];
        if (acc_transaction_income.count()  >  0)
        {
            income_total = (income_total  +  acc_transaction_income.sum(Amount));
        }
        if (acc_transaction_income.count()  >  0)
        {
            jan_amt_income = Account_Transactions[(((Account == income_acc.ID && Job_Database in project_list) && GL.Date_of_Transaction >= ("1-Jan-" + year).toDate()) && GL.Date_of_Transaction <= ("31-Jan-" + year).toDate())].sum(Amount);
            feb_amt_income = Account_Transactions[(((Account == income_acc.ID && Job_Database in project_list) && GL.Date_of_Transaction >= ("1-Feb-" + year).toDate()) && GL.Date_of_Transaction <= ("29-Feb-" + year).toDate())].sum(Amount);
            mar_amt_income = Account_Transactions[(((Account == income_acc.ID && Job_Database in project_list) && GL.Date_of_Transaction >= ("1-Mar-" + year).toDate()) && GL.Date_of_Transaction <= ("31-Mar-" + year).toDate())].sum(Amount);
            apr_amt_income = Account_Transactions[(((Account == income_acc.ID && Job_Database in project_list) && GL.Date_of_Transaction >= ("1-Apr-" + year).toDate()) && GL.Date_of_Transaction <= ("30-Apr-" + year).toDate())].sum(Amount);
            may_amt_income = Account_Transactions[(((Account == income_acc.ID && Job_Database in project_list) && GL.Date_of_Transaction >= ("1-May-" + year).toDate()) && GL.Date_of_Transaction <= ("31-May-" + year).toDate())].sum(Amount);
            jun_amt_income = Account_Transactions[(((Account == income_acc.ID && Job_Database in project_list) && GL.Date_of_Transaction >= ("1-Jun-" + year).toDate()) && GL.Date_of_Transaction <= ("30-Jun-" + year).toDate())].sum(Amount);
            jul_amt_income = Account_Transactions[(((Account == income_acc.ID && Job_Database in project_list) && GL.Date_of_Transaction >= ("1-Jul-" + year).toDate()) && GL.Date_of_Transaction <= ("31-Jul-" + year).toDate())].sum(Amount);
            aug_amt_income = Account_Transactions[(((Account == income_acc.ID && Job_Database in project_list) && GL.Date_of_Transaction >= ("1-Aug-" + year).toDate()) && GL.Date_of_Transaction <= ("31-Aug-" + year).toDate())].sum(Amount);
            sep_amt_income = Account_Transactions[(((Account == income_acc.ID && Job_Database in project_list) && GL.Date_of_Transaction >= ("1-Sep-" + year).toDate()) && GL.Date_of_Transaction <= ("30-Sep-" + year).toDate())].sum(Amount);
            oct_amt_income = Account_Transactions[(((Account == income_acc.ID && Job_Database in project_list) && GL.Date_of_Transaction >= ("1-Oct-" + year).toDate()) && GL.Date_of_Transaction <= ("31-Oct-" + year).toDate())].sum(Amount);
            nov_amt_income = Account_Transactions[(((Account == income_acc.ID && Job_Database in project_list) && GL.Date_of_Transaction >= ("1-Nov-" + year).toDate()) && GL.Date_of_Transaction <= ("30-Nov-" + year).toDate())].sum(Amount);
            dec_amt_income = Account_Transactions[(((Account == income_acc.ID && Job_Database in project_list) && GL.Date_of_Transaction >= ("1-Dec-" + year).toDate()) && GL.Date_of_Transaction <= ("31-Dec-" + year).toDate())].sum(Amount);
            jan_tot = (jan_tot  +  ifnull(jan_amt_income,0.0));
            feb_tot = (feb_tot  +  ifnull(feb_amt_income,0.0));
            mar_tot = (mar_tot  +  ifnull(mar_amt_income,0.0));
            apr_tot = (apr_tot  +  ifnull(apr_amt_income,0.0));
            may_tot = (may_tot  +  ifnull(may_amt_income,0.0));
            jun_tot = (jun_tot  +  ifnull(jun_amt_income,0.0));
            jul_tot = (jul_tot  +  ifnull(jul_amt_income,0.0));
            aug_tot = (aug_tot  +  ifnull(aug_amt_income,0.0));
            sep_tot = (sep_tot  +  ifnull(sep_amt_income,0.0));
            oct_tot = (oct_tot  +  ifnull(oct_amt_income,0.0));
            nov_tot = (nov_tot  +  ifnull(nov_amt_income,0.0));
            dec_tot = (dec_tot  +  ifnull(dec_amt_income,0.0));%>            <div class="row">
			<input id="income" type="checkbox" checked style="display:none;"><%proj_total = 0.0;
            for each proj_id in project_list
            {
                project  =  Project_Database  [ID == proj_id];
                acc_transaction_proj  =  Account_Transactions  [(((Account == income_acc.ID && Job_Database == proj_id) && Added_Time >= st_date) && Added_Time <= end_date)];
                if (acc_transaction_proj.count()  >  0)
                {
                    income_total_proj = (proj_total  +  acc_transaction_proj.sum(Amount));
                }
                if (acc_transaction_proj.count()  >  0)
                {
                    jan_amt_proj = Account_Transactions[(((Account == income_acc.ID && Job_Database == proj_id) && GL.Date_of_Transaction >= ("1-Jan-" + year).toDate()) && GL.Date_of_Transaction <= ("31-Jan-" + year).toDate())].sum(Amount);
                    feb_amt_proj = Account_Transactions[(((Account == income_acc.ID && Job_Database == proj_id) && GL.Date_of_Transaction >= ("1-Feb-" + year).toDate()) && GL.Date_of_Transaction <= ("29-Feb-" + year).toDate())].sum(Amount);
                    mar_amt_proj = Account_Transactions[(((Account == income_acc.ID && Job_Database == proj_id) && GL.Date_of_Transaction >= ("1-Mar-" + year).toDate()) && GL.Date_of_Transaction <= ("31-Mar-" + year).toDate())].sum(Amount);
                    apr_amt_proj = Account_Transactions[(((Account == income_acc.ID && Job_Database == proj_id) && GL.Date_of_Transaction >= ("1-Apr-" + year).toDate()) && GL.Date_of_Transaction <= ("30-Apr-" + year).toDate())].sum(Amount);
                    may_amt_proj = Account_Transactions[(((Account == income_acc.ID && Job_Database == proj_id) && GL.Date_of_Transaction >= ("1-May-" + year).toDate()) && GL.Date_of_Transaction <= ("31-May-" + year).toDate())].sum(Amount);
                    jun_amt_proj = Account_Transactions[(((Account == income_acc.ID && Job_Database == proj_id) && GL.Date_of_Transaction >= ("1-Jun-" + year).toDate()) && GL.Date_of_Transaction <= ("30-Jun-" + year).toDate())].sum(Amount);
                    jul_amt_proj = Account_Transactions[(((Account == income_acc.ID && Job_Database == proj_id) && GL.Date_of_Transaction >= ("1-Jul-" + year).toDate()) && GL.Date_of_Transaction <= ("31-Jul-" + year).toDate())].sum(Amount);
                    aug_amt_proj = Account_Transactions[(((Account == income_acc.ID && Job_Database == proj_id) && GL.Date_of_Transaction >= ("1-Aug-" + year).toDate()) && GL.Date_of_Transaction <= ("31-Aug-" + year).toDate())].sum(Amount);
                    sep_amt_proj = Account_Transactions[(((Account == income_acc.ID && Job_Database == proj_id) && GL.Date_of_Transaction >= ("1-Sep-" + year).toDate()) && GL.Date_of_Transaction <= ("30-Sep-" + year).toDate())].sum(Amount);
                    oct_amt_proj = Account_Transactions[(((Account == income_acc.ID && Job_Database == proj_id) && GL.Date_of_Transaction >= ("1-Oct-" + year).toDate()) && GL.Date_of_Transaction <= ("31-Oct-" + year).toDate())].sum(Amount);
                    nov_amt_proj = Account_Transactions[(((Account == income_acc.ID && Job_Database == proj_id) && GL.Date_of_Transaction >= ("1-Nov-" + year).toDate()) && GL.Date_of_Transaction <= ("30-Nov-" + year).toDate())].sum(Amount);
                    dec_amt_proj = Account_Transactions[(((Account == income_acc.ID && Job_Database == proj_id) && GL.Date_of_Transaction >= ("1-Dec-" + year).toDate()) && GL.Date_of_Transaction <= ("31-Dec-" + year).toDate())].sum(Amount);%>                    <div class="row">
						<div class="col-xs-2" style="border-radius: 4px 4px 0 0;font-size: 11px !important; font-family: Calibri;margin-top: 6px;text-align:right;">
							<label id="income"><b><%=project.Project_Number%> - <%=project.Job_Name%></b></label>
						</div>
						<div class="col-xs-8" style="border-radius: 4px 4px 0 0;font-size: 11px !important; font-family: Calibri;margin-top: 6px;text-align:right;">
							<div class="col-xs-1" style="font-size: 10px;">
								<%=thisapp.nullFix.currencyToStr(jan_amt_proj)%>
							</div>
							<div class="col-xs-1" style="font-size: 10px;">
								<%=thisapp.nullFix.currencyToStr(feb_amt_proj)%>
							</div>
							<div class="col-xs-1" style="font-size: 10px;">
								<%=thisapp.nullFix.currencyToStr(mar_amt_proj)%>
							</div>
							<div class="col-xs-1" style="font-size: 10px;">
								<%=thisapp.nullFix.currencyToStr(apr_amt_proj)%>
							</div>
							<div class="col-xs-1" style="font-size: 10px;">
								<%=thisapp.nullFix.currencyToStr(may_amt_proj)%>
							</div>
							<div class="col-xs-1" style="font-size: 10px;">
								<%=thisapp.nullFix.currencyToStr(jun_amt_proj)%>
							</div>
							<div class="col-xs-1" style="font-size: 10px;">
								<%=thisapp.nullFix.currencyToStr(jul_amt_proj)%>
							</div>
							<div class="col-xs-1" style="font-size: 10px;">
								<%=thisapp.nullFix.currencyToStr(aug_amt_proj)%>
							</div>
							<div class="col-xs-1" style="font-size: 10px;">
								<%=thisapp.nullFix.currencyToStr(sep_amt_proj)%>
							</div>
							<div class="col-xs-1" style="font-size: 10px;">
								<%=thisapp.nullFix.currencyToStr(oct_amt_proj)%>
							</div>
							<div class="col-xs-1" style="font-size: 10px;">
								<%=thisapp.nullFix.currencyToStr(nov_amt_proj)%>
							</div>
							<div class="col-xs-1" style="font-size: 10px;">
								<%=thisapp.nullFix.currencyToStr(dec_amt_proj)%>
							</div>
						</div>
						<div class="col-xs-2" style="border-radius: 4px 4px 0 0;font-size: 11px !important; font-family: Calibri;margin-top: 6px;text-align:right;">
							<%=acc_transaction_proj.sum(Amount).round(2)%>
						</div>
					</div>                <%}
            }%>            </div>
				<div class="row " id="pnl_table" style="font-weight: bolder;">
					<div class="col-xs-2" style="border-radius: 4px 4px 0 0;font-size: 11px !important; font-family: Calibri;margin-top: 6px;text-align:right;">
						<label class="btn btn-xs p-r-0 btn-primary p-a-0" for="income"><%=income_acc.Account_Number%> - <%=income_acc.Account_Name%></label>
					</div>
					<div class="col-xs-8" style="border-radius: 4px 4px 0 0;font-size: 11px !important; font-family: Calibri;margin-top: 6px;text-align:right;">
						<div class="col-xs-1" style="font-size: 10px;">
							<%=thisapp.nullFix.currencyToStr(jan_amt_income)%>
						</div>
						<div class="col-xs-1" style="font-size: 10px;">
							<%=thisapp.nullFix.currencyToStr(feb_amt_income)%>
						</div>
						<div class="col-xs-1" style="font-size: 10px;">
							<%=thisapp.nullFix.currencyToStr(mar_amt_income)%>
						</div>
						<div class="col-xs-1" style="font-size: 10px;">
							<%=thisapp.nullFix.currencyToStr(apr_amt_income)%>
						</div>
						<div class="col-xs-1" style="font-size: 10px;">
							<%=thisapp.nullFix.currencyToStr(may_amt_income)%>
						</div>
						<div class="col-xs-1" style="font-size: 10px;">
							<%=thisapp.nullFix.currencyToStr(jun_amt_income)%>
						</div>
						<div class="col-xs-1" style="font-size: 10px;">
							<%=thisapp.nullFix.currencyToStr(jul_amt_income)%>
						</div>
						<div class="col-xs-1" style="font-size: 10px;">
							<%=thisapp.nullFix.currencyToStr(aug_amt_income)%>
						</div>
						<div class="col-xs-1" style="font-size: 10px;">
							<%=thisapp.nullFix.currencyToStr(sep_amt_income)%>
						</div>
						<div class="col-xs-1" style="font-size: 10px;">
							<%=thisapp.nullFix.currencyToStr(oct_amt_income)%>
						</div>
						<div class="col-xs-1" style="font-size: 10px;" >
							<%=thisapp.nullFix.currencyToStr(nov_amt_income)%>
						</div>
						<div class="col-xs-1" style="font-size: 10px;">
							<%=thisapp.nullFix.currencyToStr(dec_amt_income)%>
						</div>
					</div>
					<div class="col-xs-2" style="border-radius: 4px 4px 0 0;font-size: 11px !important; font-family: Calibri;margin-top: 6px;text-align:right;">
						<%=thisapp.nullFix.currencyToStr((acc_transaction_income.sum(Amount).round(2)))%>
					</div>
						</div>        <%}
    }%>    <div class="row " id="pnl_table" style='margin-top:10px;border-top:1px solid!important;border-bottom:1px solid!important;'>
					<div class="col-xs-2" >
						<b>Income Subtotal</b>
					</div>
					<div class="col-xs-8" style="border-radius: 4px 4px 0 0;font-size: 11px !important; font-family: Calibri;margin-top: 6px;text-align:right;">
						<div class="col-xs-1" style="font-size: 10px;">
							<b><%=thisapp.nullFix.currencyToStr(jan_tot)%></b>
						</div>
						<div class="col-xs-1" style="font-size: 10px;">
							<b><%=thisapp.nullFix.currencyToStr(feb_tot)%></b>
						</div>
						<div class="col-xs-1" style="font-size: 10px;">
							<b><%=thisapp.nullFix.currencyToStr(mar_tot)%></b>
						</div>
						<div class="col-xs-1" style="font-size: 10px;">
							<b><%=thisapp.nullFix.currencyToStr(apr_tot)%></b>
						</div>
						<div class="col-xs-1" style="font-size: 10px;">
							<b><%=thisapp.nullFix.currencyToStr(may_tot)%></b>
						</div>
						<div class="col-xs-1" style="font-size: 10px;">
							<b><%=thisapp.nullFix.currencyToStr(jun_tot)%></b>
						</div>
						<div class="col-xs-1" style="font-size: 10px;">
							<b><%=thisapp.nullFix.currencyToStr(jul_tot)%></b>
						</div>
						<div class="col-xs-1" style="font-size: 10px;">
							<b><%=thisapp.nullFix.currencyToStr(aug_tot)%></b>
						</div>
						<div class="col-xs-1" style="font-size: 10px;">
							<b><%=thisapp.nullFix.currencyToStr(sep_tot)%></b>
						</div>
						<div class="col-xs-1" style="font-size: 10px;">
							<b><%=thisapp.nullFix.currencyToStr(oct_tot)%></b>
						</div>
						<div class="col-xs-1" style="font-size: 10px;">
							<b><%=thisapp.nullFix.currencyToStr(nov_tot)%></b>
						</div>
						<div class="col-xs-1" style="font-size: 10px;">
							<b><%=thisapp.nullFix.currencyToStr(dec_tot)%></b>
						</div>
					</div>
					<div class="col-xs-2" style="border-radius: 4px 4px 0 0;font-size: 11px !important; font-family: Calibri;margin-top: 6px;text-align:right;">
						<b>$ <%=thisapp.nullFix.currencyToStr(income_total)%></b>
					</div>
				</div>
				<!--div class="row " id="pnl_table" style='margin-top:10px;border-top:1px solid!important;border-bottom:1px solid!important;'>
					<div class="col-xs-2" >
					</div>
					<div class="col-xs-8" style="border-radius: 4px 4px 0 0;font-size: 11px !important; font-family: Calibri;margin-top: 6px;text-align:right;">
						<p style="text-align:right"><b>Income Subtotal</b></p>
					</div>
					<div class="col-xs-2" style="border-radius: 4px 4px 0 0;font-size: 11px !important; font-family: Calibri;margin-top: 6px;text-align:right;">
						<b>$ <%=thisapp.nullFix.currencyToStr(income_total)%></b>
					</div>
				</div-->
				<div class="row " id="pnl_table">
					<div class="col-xs-12" style="border-radius: 4px 4px 0 0;font-size: 11px !important; font-family: Calibri;">
						<p><b>Expense</b></p>
					</div>
				</div><%exp_total = 0.0;
    jan_tot_exp = 0.0;
    feb_tot_exp = 0.0;
    mar_tot_exp = 0.0;
    apr_tot_exp = 0.0;
    may_tot_exp = 0.0;
    jun_tot_exp = 0.0;
    jul_tot_exp = 0.0;
    aug_tot_exp = 0.0;
    sep_tot_exp = 0.0;
    oct_tot_exp = 0.0;
    nov_tot_exp = 0.0;
    dec_tot_exp = 0.0;
    for each exp_acc in Chart_of_Accounts  [(Account_Number >= 6000 && Account_Number <= 6999)] sort by  Account_Number 
    {
        acc_transaction_exp  =  Account_Transactions  [(((Account == exp_acc.ID && Job_Database in project_list) && Added_Time >= st_date) && Added_Time <= end_date)];
        if (acc_transaction_exp.count()  >  0)
        {
            exp_total = (exp_total  +  acc_transaction_exp.sum(Amount));
        }
        if (acc_transaction_exp.count()  >  0)
        {
            jan_amt_exp = Account_Transactions[(((Account == exp_acc.ID && Job_Database in project_list) && GL.Date_of_Transaction >= ("1-Jan-" + year).toDate()) && GL.Date_of_Transaction <= ("31-Jan-" + year).toDate())].sum(Amount);
            feb_amt_exp = Account_Transactions[(((Account == exp_acc.ID && Job_Database in project_list) && GL.Date_of_Transaction >= ("1-Feb-" + year).toDate()) && GL.Date_of_Transaction <= ("29-Feb-" + year).toDate())].sum(Amount);
            mar_amt_exp = Account_Transactions[(((Account == exp_acc.ID && Job_Database in project_list) && GL.Date_of_Transaction >= ("1-Mar-" + year).toDate()) && GL.Date_of_Transaction <= ("31-Mar-" + year).toDate())].sum(Amount);
            apr_amt_exp = Account_Transactions[(((Account == exp_acc.ID && Job_Database in project_list) && GL.Date_of_Transaction >= ("1-Apr-" + year).toDate()) && GL.Date_of_Transaction <= ("30-Apr-" + year).toDate())].sum(Amount);
            may_amt_exp = Account_Transactions[(((Account == exp_acc.ID && Job_Database in project_list) && GL.Date_of_Transaction >= ("1-May-" + year).toDate()) && GL.Date_of_Transaction <= ("31-May-" + year).toDate())].sum(Amount);
            jun_amt_exp = Account_Transactions[(((Account == exp_acc.ID && Job_Database in project_list) && GL.Date_of_Transaction >= ("1-Jun-" + year).toDate()) && GL.Date_of_Transaction <= ("30-Jun-" + year).toDate())].sum(Amount);
            jul_amt_exp = Account_Transactions[(((Account == exp_acc.ID && Job_Database in project_list) && GL.Date_of_Transaction >= ("1-Jul-" + year).toDate()) && GL.Date_of_Transaction <= ("31-Jul-" + year).toDate())].sum(Amount);
            aug_amt_exp = Account_Transactions[(((Account == exp_acc.ID && Job_Database in project_list) && GL.Date_of_Transaction >= ("1-Aug-" + year).toDate()) && GL.Date_of_Transaction <= ("31-Aug-" + year).toDate())].sum(Amount);
            sep_amt_exp = Account_Transactions[(((Account == exp_acc.ID && Job_Database in project_list) && GL.Date_of_Transaction >= ("1-Sep-" + year).toDate()) && GL.Date_of_Transaction <= ("30-Sep-" + year).toDate())].sum(Amount);
            oct_amt_exp = Account_Transactions[(((Account == exp_acc.ID && Job_Database in project_list) && GL.Date_of_Transaction >= ("1-Oct-" + year).toDate()) && GL.Date_of_Transaction <= ("31-Oct-" + year).toDate())].sum(Amount);
            nov_amt_exp = Account_Transactions[(((Account == exp_acc.ID && Job_Database in project_list) && GL.Date_of_Transaction >= ("1-Nov-" + year).toDate()) && GL.Date_of_Transaction <= ("30-Nov-" + year).toDate())].sum(Amount);
            dec_amt_exp = Account_Transactions[(((Account == exp_acc.ID && Job_Database in project_list) && GL.Date_of_Transaction >= ("1-Dec-" + year).toDate()) && GL.Date_of_Transaction <= ("31-Dec-" + year).toDate())].sum(Amount);
            jan_tot_exp = (jan_tot_exp  +  ifnull(jan_amt_exp,0.0));
            feb_tot_exp = (feb_tot_exp  +  ifnull(feb_amt_exp,0.0));
            mar_tot_exp = (mar_tot_exp  +  ifnull(mar_amt_exp,0.0));
            apr_tot_exp = (apr_tot_exp  +  ifnull(apr_amt_exp,0.0));
            may_tot_exp = (may_tot_exp  +  ifnull(may_amt_exp,0.0));
            jun_tot_exp = (jun_tot_exp  +  ifnull(jun_amt_exp,0.0));
            jul_tot_exp = (jul_tot_exp  +  ifnull(jul_amt_exp,0.0));
            aug_tot_exp = (aug_tot_exp  +  ifnull(aug_amt_exp,0.0));
            sep_tot_exp = (sep_tot_exp  +  ifnull(sep_amt_exp,0.0));
            oct_tot_exp = (oct_tot_exp  +  ifnull(oct_amt_exp,0.0));
            nov_tot_exp = (nov_tot_exp  +  ifnull(nov_amt_exp,0.0));
            dec_tot_exp = (dec_tot_exp  +  ifnull(dec_amt_exp,0.0));%>            <div class="row ">
					<div class="col-xs-2" style="border-radius: 4px 4px 0 0;font-size: 11px !important; font-family: Calibri;margin-top: 6px;text-align:right;">
						<a target="_blank" href="<%=base_url%>#View:Expense_Report?zc_Header=false&Account.ID=<%=exp_acc.ID%>"><label class="btn btn-xs btn-warning" id="expence" style="font-size:9px !important;white-space: normal;"><%=exp_acc.Account_Number%> - <%=exp_acc.Account_Name%></label></a>
					</div>
					<div class="col-xs-8" style="border-radius: 4px 4px 0 0;font-size: 11px !important; font-family: Calibri;margin-top: 6px;text-align:right;">
						<div class="col-xs-1" style="font-size: 10px;">
							<%=thisapp.nullFix.currencyToStr(jan_amt_exp)%>
						</div>
						<div class="col-xs-1" style="font-size: 10px;">
							<%=thisapp.nullFix.currencyToStr(feb_amt_exp)%>
						</div>
						<div class="col-xs-1" style="font-size: 10px;">
							<%=thisapp.nullFix.currencyToStr(mar_amt_exp)%>
						</div>
						<div class="col-xs-1" style="font-size: 10px;">
							<%=thisapp.nullFix.currencyToStr(apr_amt_exp)%>
						</div>
						<div class="col-xs-1" style="font-size: 10px;">
							<%=thisapp.nullFix.currencyToStr(may_amt_exp)%>
						</div>
						<div class="col-xs-1" style="font-size: 10px;">
							<%=thisapp.nullFix.currencyToStr(jun_amt_exp)%>
						</div>
						<div class="col-xs-1" style="font-size: 10px;">
							<%=thisapp.nullFix.currencyToStr(jul_amt_exp)%>
						</div>
						<div class="col-xs-1" style="font-size: 10px;">
							<%=thisapp.nullFix.currencyToStr(aug_amt_exp)%>
						</div>
						<div class="col-xs-1" style="font-size: 10px;">
							<%=thisapp.nullFix.currencyToStr(sep_amt_exp)%>
						</div>
						<div class="col-xs-1" style="font-size: 10px;">
							<%=thisapp.nullFix.currencyToStr(oct_amt_exp)%>
						</div>
						<div class="col-xs-1" style="font-size: 10px;">
							<%=thisapp.nullFix.currencyToStr(nov_amt_exp)%>
						</div>
						<div class="col-xs-1" style="font-size: 10px;">
							<%=thisapp.nullFix.currencyToStr(dec_amt_exp)%>
						</div>
					</div>
					<div class="col-xs-2" style="border-radius: 4px 4px 0 0;font-size: 11px !important; font-family: Calibri;margin-top: 6px;text-align:right;">
						<%=thisapp.nullFix.currencyToStr((acc_transaction_exp.sum(Amount).round(2)))%>
					</div>
				</div>        <%}
    }%>    <div class="row " id="pnl_table" style='margin-top:10px;border-top:1px solid!important;border-bottom:1px solid!important;'>
					<div class="col-xs-2" >
						<b>Expense Subtotal</b>
					</div>
					<div class="col-xs-8" style="border-radius: 4px 4px 0 0;font-size: 11px !important; font-family: Calibri;margin-top: 6px;text-align:right;">
						<div class="col-xs-1" style="font-size: 10px;">
							<b><%=thisapp.nullFix.currencyToStr(jan_tot_exp)%></b>
						</div>
						<div class="col-xs-1" style="font-size: 10px;">
							<b><%=thisapp.nullFix.currencyToStr(feb_tot_exp)%></b>
						</div>
						<div class="col-xs-1" style="font-size: 10px;">
							<b><%=thisapp.nullFix.currencyToStr(mar_tot_exp)%></b>
						</div>
						<div class="col-xs-1" style="font-size: 10px;">
							<b><%=thisapp.nullFix.currencyToStr(apr_tot_exp)%></b>
						</div>
						<div class="col-xs-1" style="font-size: 10px;">
							<b><%=thisapp.nullFix.currencyToStr(may_tot_exp)%></b>
						</div>
						<div class="col-xs-1" style="font-size: 10px;">
							<b><%=thisapp.nullFix.currencyToStr(jun_tot_exp)%></b>
						</div>
						<div class="col-xs-1" style="font-size: 10px;">
							<b><%=thisapp.nullFix.currencyToStr(jul_tot_exp)%></b>
						</div>
						<div class="col-xs-1" style="font-size: 10px;" >
							<b><%=thisapp.nullFix.currencyToStr(aug_tot_exp)%></b>
						</div>
						<div class="col-xs-1" style="font-size: 10px;">
							<b><%=thisapp.nullFix.currencyToStr(sep_tot_exp)%></b>
						</div>
						<div class="col-xs-1" style="font-size: 10px;" >
							<b><%=thisapp.nullFix.currencyToStr(oct_tot_exp)%></b>
						</div>
						<div class="col-xs-1" style="font-size: 10px;" >
							<b><%=thisapp.nullFix.currencyToStr(nov_tot_exp)%></b>
						</div>
						<div class="col-xs-1" style="font-size: 10px;">
							<b><%=thisapp.nullFix.currencyToStr(dec_tot_exp)%></b>
						</div>
					</div>
					<div class="col-xs-2" style="border-radius: 4px 4px 0 0;font-size: 11px !important; font-family: Calibri;margin-top: 6px;text-align:right;">
						<b>$ <%=thisapp.nullFix.currencyToStr(exp_total)%></b>
					</div>
				</div>
				<!--div class="row " id="pnl_table" style='margin-top:10px;border-top:1px solid!important;border-bottom:1px solid!important;'>
					<div class="col-xs-2" >
					</div>
					<div class="col-xs-8" style="border-radius: 4px 4px 0 0;font-size: 11px !important; font-family: Calibri;margin-top: 6px;text-align:right;">
						<p style="text-align:right"><b>Expense Subtotal</b></p>
					</div>
					<div class="col-xs-2" style="border-radius: 4px 4px 0 0;font-size: 11px !important; font-family: Calibri;margin-top: 6px;text-align:right;">
						<b>$ <%=thisapp.nullFix.currencyToStr(exp_total)%></b>
					</div>
				</div-->
				<div class="row " style='margin-top:10px;border-top:1px solid!important;border-bottom:1px solid!important;'>
					<div class="col-xs-2" >
					</div>
					<div class="col-xs-8" style="border-radius: 4px 4px 0 0;font-size: 11px !important; font-family: Calibri;margin-top: 6px;text-align:right;">
						<p style="text-align:right"><b>Total</b></p>
					</div>
					<div class="col-xs-2" style="border-radius: 4px 4px 0 0;font-size: 11px !important; font-family: Calibri;margin-top: 6px;text-align:right;">
						<b>$ <%=thisapp.nullFix.currencyToStr((income_total-exp_total))%></b>
					</div>
				</div>
			</div>
  		</div>
  	</div>
  </div><%}%>

