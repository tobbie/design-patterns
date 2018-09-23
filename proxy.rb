# Intent
#

class Account
  attr_reader :balance

  def initialize(starting_blance)
    @balance = starting_blance
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end
end

class AccountProtectionProxy
  def initialize(real_account, owner_name)
    @subject = real_account
    @owner_name = owner_name
  end
  
  def deposit(amount)
    check_access
    return @subject.deposit(amount)
  end

  def withdraw(amount)
    check_access
    return @subject.withdraw(amount)
  end

  def balance
    check_access
    return @subject.balance
  end

  def check_access
    if @owner_name != 'Rolake'
      raise "Illegal access"
    end
  end
end

account = Account.new(100)
account.deposit(50)
account.withdraw(10)

proxy = AccountProtectionProxy.new(account, 'Rolake')
proxy.deposit(20)
proxy.withdraw(40)
puts proxy.balance
