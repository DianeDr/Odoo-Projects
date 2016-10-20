<div class="row">
				<input id="expense" type="checkbox" checked ">
				<%emp_total = 0.0;
					emp_list = Account_Transactions  [(((Account == exp_acc.ID && Job_Database in project_list) && Added_Time >= st_date) && Added_Time <= end_date)].Counterparty.getall();
					for each emp_id in emp_list
				{
					emp = Counterparties [ID == emp_id];
					acc_transaction_emp  =  Account_Transactions  [(((Account == exp_acc.ID && Counterparty == emp_id) && Added_Time >= st_date) && Added_Time <= end_date)];
					if (acc_transaction_emp.count()  >  0)
					{
						income_total_emp = (proj_total  +  acc_transaction_emp.sum(Amount));
					}
					if (acc_transaction_emp.count()  >  0)
					{
						jan_amt_emp = Account_Transactions[(((Account == exp_acc.ID && Counterparty == emp_id) && GL.Date_of_Transaction >= ("1-Jan-" + year).toDate()) && GL.Date_of_Transaction <= ("31-Jan-" + year).toDate())].sum(Amount);
						feb_amt_emp = Account_Transactions[(((Account == exp_acc.ID && Counterparty == emp_id) && GL.Date_of_Transaction >= ("1-Feb-" + year).toDate()) && GL.Date_of_Transaction <= ("29-Feb-" + year).toDate())].sum(Amount);
						mar_amt_emp = Account_Transactions[(((Account == exp_acc.ID && Counterparty == emp_id) && GL.Date_of_Transaction >= ("1-Mar-" + year).toDate()) && GL.Date_of_Transaction <= ("31-Mar-" + year).toDate())].sum(Amount);
						apr_amt_emp = Account_Transactions[(((Account == exp_acc.ID && Counterparty == emp_id) && GL.Date_of_Transaction >= ("1-Apr-" + year).toDate()) && GL.Date_of_Transaction <= ("30-Apr-" + year).toDate())].sum(Amount);
						may_amt_emp = Account_Transactions[(((Account == exp_acc.ID && Counterparty == emp_id) && GL.Date_of_Transaction >= ("1-May-" + year).toDate()) && GL.Date_of_Transaction <= ("31-May-" + year).toDate())].sum(Amount);
						jun_amt_emp = Account_Transactions[(((Account == exp_acc.ID && Counterparty == emp_id) && GL.Date_of_Transaction >= ("1-Jun-" + year).toDate()) && GL.Date_of_Transaction <= ("30-Jun-" + year).toDate())].sum(Amount);
						jul_amt_emp = Account_Transactions[(((Account == exp_acc.ID && Counterparty == emp_id) && GL.Date_of_Transaction >= ("1-Jul-" + year).toDate()) && GL.Date_of_Transaction <= ("31-Jul-" + year).toDate())].sum(Amount);
						aug_amt_emp = Account_Transactions[(((Account == exp_acc.ID && Counterparty == emp_id) && GL.Date_of_Transaction >= ("1-Aug-" + year).toDate()) && GL.Date_of_Transaction <= ("31-Aug-" + year).toDate())].sum(Amount);
						sep_amt_emp = Account_Transactions[(((Account == exp_acc.ID && Counterparty == emp_id) && GL.Date_of_Transaction >= ("1-Sep-" + year).toDate()) && GL.Date_of_Transaction <= ("30-Sep-" + year).toDate())].sum(Amount);
						oct_amt_emp = Account_Transactions[(((Account == exp_acc.ID && Counterparty == emp_id) && GL.Date_of_Transaction >= ("1-Oct-" + year).toDate()) && GL.Date_of_Transaction <= ("31-Oct-" + year).toDate())].sum(Amount);
						nov_amt_emp = Account_Transactions[(((Account == exp_acc.ID && Counterparty == emp_id) && GL.Date_of_Transaction >= ("1-Nov-" + year).toDate()) && GL.Date_of_Transaction <= ("30-Nov-" + year).toDate())].sum(Amount);
						dec_amt_emp = Account_Transactions[(((Account == exp_acc.ID && Counterparty == emp_id) && GL.Date_of_Transaction >= ("1-Dec-" + year).toDate()) && GL.Date_of_Transaction <= ("31-Dec-" + year).toDate())].sum(Amount);
						%>
					<div class="row">
						<div class="col-xs-3" style="border-radius: 4px 4px 0 0;font-size: 11px !important; font-family: Calibri;margin-top: 6px;text-align:right;">
							<label id="income"><b><%=emp.Name%></b></label>
						</div>
						<div class="col-xs-7" style="border-radius: 4px 4px 0 0;font-size: 11px !important; font-family: Calibri;margin-top: 6px;text-align:right;">
							<div class="col-xs-1" >
								<%=ifnull(jan_amt_emp,0.0)%>
							</div>
							<div class="col-xs-1" >
								<%=ifnull(feb_amt_emp,0.0)%>
							</div>
							<div class="col-xs-1" >
								<%=ifnull(mar_amt_emp,0.0)%>
							</div>
							<div class="col-xs-1" >
								<%=ifnull(apr_amt_emp,0.0)%>
							</div>
							<div class="col-xs-1" >
								<%=ifnull(may_amt_emp,0.0)%>
							</div>
							<div class="col-xs-1" >
								<%=ifnull(jun_amt_emp,0.0)%>
							</div>
							<div class="col-xs-1" >
								<%=ifnull(jul_amt_emp,0.0)%>
							</div>
							<div class="col-xs-1" >
								<%=ifnull(aug_amt_emp,0.0)%>
							</div>
							<div class="col-xs-1" >
								<%=ifnull(sep_amt_emp,0.0)%>
							</div>
							<div class="col-xs-1" >
								<%=ifnull(oct_amt_emp,0.0)%>
							</div>
							<div class="col-xs-1" >
								<%=ifnull(nov_amt_emp,0.0)%>
							</div>
							<div class="col-xs-1" >
								<%=ifnull(dec_amt_emp,0.0)%>
							</div>
						</div>
						<div class="col-xs-2" style="border-radius: 4px 4px 0 0;font-size: 11px !important; font-family: Calibri;margin-top: 6px;text-align:right;">
							<%=acc_transaction_emp.sum(Amount).round(2)%>
						</div>
					</div><%}}%>
				</div>
