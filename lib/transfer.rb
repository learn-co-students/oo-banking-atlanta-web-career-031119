require_relative './bank_account'
require 'pry'

class Transfer
  
  attr_reader :sender, :receiver 
  attr_accessor :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?(*)
    if sender.valid? && receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
      if sender.valid? == true && amount < sender.balance && self.status == "pending"
        receiver.balance= receiver.balance + amount
        sender.balance = sender.balance - amount
        self.amount = 50
        self.status = "complete"
      elsif sender.valid? == false || amount > sender.balance
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
    end
  end    

  def reverse_transfer
      if self.status == "complete"
        receiver.balance = receiver.balance - amount
        sender.balance = sender.balance + amount
        self.status = "reversed"
    end
  end
end
