desc 'Ethereum demo'
task demo: :environment do
  
  if Company.first
    contract_address = Company.first.address
  else
    contract_address = nil
  end
  
  if not contract_address
    contract = Ethereum::Contract.create(file: "RubyToken.sol")
    address = contract.deploy_and_wait(1000000, "RubyToken", 2, "RBY")
    Company.create!(address: address)
  else
    content = File.read('abi.json')
    abi = JSON.parse(content)
    contract = Ethereum::Contract.create(name: "RubyToken", address: contract_address, abi: abi)
    
  end    
  contract.transact_and_wait.approve("0x00917Db9021DB659a5A1113a20fBD55DeB17a33B")

end