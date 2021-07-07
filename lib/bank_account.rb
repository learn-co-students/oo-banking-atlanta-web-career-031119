class BankAccount
    attr_reader :name
    attr_accessor :balance, :status
    def initialize(name, balance=1000)
        @name = name
        @balance = balance
        @status = 'open'
    end

    def deposit(amount)
        self.balance += amount
    end

    def withdraw(amount)
        self.balance -= amount
    end

    def display_balance
        "Your balance is $#{self.balance}."
    end

    def valid?
        if @status == 'open' && @balance > 0
            return true
        else
            return false
        end
    end

    def close_account
        @status = 'closed'
    end
end
