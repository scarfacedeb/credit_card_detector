# CreditCardDetector

Gem provides credit card number validator and type detector. 

It checks whether or not a given number actually falls within the ranges of possible numbers for given brands and provides an optional Luhn check.

More info about card BIN numbers http://en.wikipedia.org/wiki/Bank_card_number

## Installation

Add this line to your application's Gemfile:

    gem 'credit_card_detector'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install credit_card_detector

## Usage


The following issuing institutes are accepted:
    
    Name   |    Key     | 
---------------------   | ------------| 
[American Express](http://en.wikipedia.org/wiki/American_Express) | :amex
[China UnionPay](http://en.wikipedia.org/wiki/China_UnionPay)    | :unionpay 
[Dankort](http://en.wikipedia.org/wiki/Dankort)      | :dankort
[Diners Club](http://en.wikipedia.org/wiki/Diners_Club_International)  | :diners   
[Elo](https://pt.wikipedia.org/wiki/Elo_Participa%C3%A7%C3%B5es_S/A)      | :elo
[Discover](http://en.wikipedia.org/wiki/Discover_Card) | :discover   
[Hipercard](http://pt.wikipedia.org/wiki/Hipercard) | :hipercard  
[JCB](http://en.wikipedia.org/wiki/Japan_Credit_Bureau)  | :jcb
[Maestro](http://en.wikipedia.org/wiki/Maestro_%28debit_card%29)    | :maestro
[MasterCard](http://en.wikipedia.org/wiki/MasterCard)  |   :mastercard
[MIR](http://www.nspk.ru/en/cards-mir/)  |   :mir
[Rupay](http://en.wikipedia.org/wiki/RuPay) |   :rupay 
[Solo](http://en.wikipedia.org/wiki/Solo_(debit_card))     | :solo
[Switch](http://en.wikipedia.org/wiki/Switch_(debit_card)) | :switch 
[Visa](http://en.wikipedia.org/wiki/Visa_Inc.)      | :visa  


### Examples

```ruby	
    number = "4111111111111111"
    detector = CreditCardDetector::Detector.new(number)
    detector.brand # Visa brand
    detector.brand_name # Visa
    detector.valid?(:mastercard, :maestro) #false
    detector.valid?(:visa, :mastercard) #true
```

### Check luhn

```ruby	
    CreditCardDetector::Detector.new(number).valid_luhn?
```  

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Original version

[credit_card_validations](https://github.com/Fivell/credit_card_validations) - provides more extended API, but dependes on activemodel and activesupport.

