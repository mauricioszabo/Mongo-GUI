#!/usr/bin/ruby

require 'rubygems'
require 'mongo'
require 'irb'

require 'proxy_database'
require 'ordered_hash'
require 'collection'

module Console
  def db
    return @database
  end

  def it
    if $last_find.nil?
      raise 'Não há mais registros ou não há cursor'
    else
      cursor = $last_collection.old_find($last_find, :skip => $last_print, :limit => 10)
      $last_print += 10
      return cursor
    end
  end

  def use(database)
    $last_find = $last_print = nil
    @database = ProxyDatabase.new(database)
    return
  end
end

if __FILE__ == $0
  include Console

  use 'test'
  IRB.start
end
