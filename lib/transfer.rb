require 'pry'

class Transfer
  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end 

  def valid?
    if self.sender.valid? && self.receiver.valid?
      return true 
    else
      return false
    end
  end

  def execute_transaction
    if self.valid? && self.status == "pending" && sender.balance >= amount
      sender.balance = sender.balance - amount
      receiver.balance = receiver.balance + amount
      self.status = "complete"
    else 
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end 
  end 

  def reverse_transfer
    if self.status == "complete"
      sender.balance = sender.balance + amount
      receiver.balance = receiver.balance - amount
      self.status = "reversed"
    end 
  end 

end

# describe '#reverse_transfer' do
#   it "can reverse a transfer between two accounts" do
#     transfer.execute_transaction
#     expect(amanda.balance).to eq(950)
#     expect(avi.balance).to eq(1050)
#     transfer.reverse_transfer
#     expect(avi.balance).to eq(1000)
#     expect(amanda.balance).to eq(1000)
#     expect(transfer.status).to eq("reversed")
#   end

#   it "it can only reverse executed transfers" do
#     transfer.reverse_transfer
#     expect(amanda.balance).to eq(1000)
#     expect(avi.balance).to eq(1000)