task :create_data => :environment do
    #crear cliente de prueba
    Customer.create(name: "Lucas", surnames: "García Viz", token: "70ce12a2-ef38-46c7-9fa8-df114a0f6dce")

    #crear tipos de cuentas de prueba
    TypeAccount.create(name: "Crédito")
    TypeAccount.create(name: "Débito")

    #crear tipos de movimientos de prueba
    TypeMovement.create(name: "Cargo")
    TypeMovement.create(name: "Abono")

    #crear cuentas de prueba
    Account.create(customer_id: 1, type_account_id: 1, total: 1000)
    Account.create(customer_id: 1, type_account_id: 2, total: 1000)
end