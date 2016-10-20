void timesheet.create(Employee_Time_Sheet ets_list)
{
	ets_id_List = ets_list.ID.getAll()
	projects_list = ETS_Line_Item [ETS in ets_id_List && Invoice is null].distinct(Project);
	for each project_id in projects_list
	{
		project = Project[ID == project_id];
		inv_id = insert into Invoice
		[
			Invoice_Date = today
			Project_Database = project_id
			Contact = project.Contact
		];
		for each ets_line in  ETS_Line_Item [ Project == project_id && Invoice is null]
		{
			ets_line.Invoice = inv_id;
		}
        invoice  =  Invoice  [ID == invoice_id];
        invoice.Total_Hours = Emp_Time_Sheet_Line[Invoice == invoice_id].sum(Hours);
        invoice.Total_Amount = (ifnull(invoice.Total_Hours,0.0)  *  ifnull(proj.Cleaning_Rate,0.0));
	}
	for each ets in ets_list
	{
		ets.Invoiced = ETS_Line_Item[ETS == ets.ID && Invoice != null ].count() > 0;
	}

}