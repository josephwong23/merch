require("bundler")
Bundler.require

get "/" do
  erb :index
end

def worksheet
  @session ||= GoogleDrive::Session.from_service_account_key("client_secret.json")
  @spreadsheet ||= @session.spreadsheet_by_title("Gangga's spreadsheet")
  @worksheet ||= @spreadsheet.worksheets.first
end

post "/" do
  new_row = [params["nameofsupplier"], params["country"], params["webadd"], params["emailadd"], params["emailadd2"], params["contactnum1"], params["contactnum2"],params["contactperson"], params["productcat"], params["businesscard"], params["brochurecat"], params["productleadshiptime"], params["shippingmethod"], params["shippingcost"], params["smallordernum"], params["unitpriceforsmallorder"], params["bulkorder"], params["unitpriceforbulkorder"], params["productsample"], params["productsample"], params["samplingcost"], params["paymentTerms"], params["PracticalComp"], params["PosCons"]]
  begin
    worksheet.insert_rows(worksheet.num_rows+1, [new_row])
    worksheet.save
    erb :thanks
  rescue
    erb :index, locals: {
      error_mesage: "Your details could not be saved, please try again!"
    }
  end
end


  # params["country"], params["webadd"], params["emailadd"], params["emailadd2"], params["contactnum1"], params["contactnum2"], params["productcat"], params["businesscard"], params["brochurecat"], params["productleadshiptime"], params["shippingcost"], params["smallorder(num)"], params["unit price for small order"], params["bulkorder"], params["unit price for bulk order"], params["productsample"]]
