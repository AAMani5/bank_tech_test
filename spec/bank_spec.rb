require 'bank'

describe Bank do

  it {is_expected.to respond_to(:create_account).with(1).argument}

end
