desc "Import products"

task :import_products, [:store] => :environment do |t, args|
    args.with_defaults(:store => Store.new)
    begin
        # store = args[:store]
        # response = open(store.website).read
        # products = JSON.parse(response)
        # installments = []
        # products.each do |item|
        #     product = Product.new
        #     product.name = item["productName"]
        #     product.price = item["items"][0]["sellers"][0]["commertialOffer"]["Price"]
        #     product.image = item["items"][0]["images"][0]["imageUrl"]
        #     product.url = item["items"][0]["sellers"][0]["addToCartLink"]
        #     product.store_id = store["_id"]
        #     product.user_id = store["user_id"]
        #     item["items"][0]["sellers"][0]["commertialOffer"]["Installments"].each do |installment|
        #         im = Installment.new
        #         im.product_id = product._id
        #         im.user_id = store["user_id"]
        #         im.value = installment["Value"]
        #         im.interestrate = installment["InterestRate"]
        #         im.totalvalueplusinterestrate = installment["TotalValuePlusInterestRate"]
        #         im.numberofinstallments = installment["NumberOfInstallments"]
        #         im.paymentsystemname = installment["PaymentSystemName"]
        #         im.paymentsystemgroupname = installment["PaymentSystemGroupName"]
        #         im.name = installment["Name"]
        #         installments << im
        #     end
        #     product.insert
        # end
        # installments.each do |item|
        #     item.insert
        # end
    rescue StandardError => e
        p e.message
    end
end