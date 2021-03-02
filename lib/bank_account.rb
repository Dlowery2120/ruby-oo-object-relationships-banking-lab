
class BankAccount
    attr_accessor :balance, :status
    attr_reader :name

    @@all = []

    def initialize (name)
        @name = name
        @balance = 1000
        @status = "open"
        @@all << self
    end

    def deposit(deposit_amount)
        self.balance += deposit_amount
    end

    def display_balance
        "Your balance is $#{self.balance}."
    end

    def valid?
        if self.balance > 0 && self.status == "open"
            true
        else 
            false
        end
    end

    def close_account
        self.status = "closed"
    end

    def self.all
        @@all
    end
end
