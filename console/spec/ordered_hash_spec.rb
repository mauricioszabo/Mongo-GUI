require 'mongo'
require 'ordered_hash'

describe OrderedHash do
  before do
    @hash1 = OrderedHash.new
    @hash2 = OrderedHash.new
    @hash3 = OrderedHash.new

    @hash1[1] = 'um'
    @hash2[2] = 'dois'
    @hash2[3] = 'tres'
    @hash3['a'] = 1
    @hash3['b'] = 2

  end

  it 'deve exibir um inspect diferenciado' do
    hash = OrderedHash.new
    hash['algo'] = 'Algo'
    hash['outro'] = [ 1, 2, 3]
    hash['mais um'] = [ @hash1, @hash2 ]
    hash[:blah] = @hash3

    puts hash.inspect
    hash.inspect.should ==
'{
  "algo" => "Algo"
  "outro" => [
    0 => 1
    1 => 2
    2 => 3
  ]
  "mais um" => [
    0 => {
      1 => "um"
    }
    1 => {
      2 => "dois"
      3 => "tres"
    }
  ]
  :blah => {
    "a" => 1
    "b" => 2
  }
}'
  end
end
