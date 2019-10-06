# frozen_string_literal: true

account_01 = Account.find_by(name: 'Wallet')
account_02 = Account.find_by(name: 'Wild rose bank')
account_03 = Account.find_by(name: 'Yambaru credit card')

account_11 = Account.find_by(name: 'Cash stash')
account_12 = Account.find_by(name: 'Zerland bank')

account_21 = Account.find_by(name: 'Developing nation index fund')
account_22 = Account.find_by(name: 'Advanced nation index fund')
account_23 = Account.find_by(name: 'Dividend emphasize fund')

History.seed(
  :date_of_onset, :account_id,
  [
    { date_of_onset: '2019-01-31', account: account_01, price: 1_201 },
    { date_of_onset: '2019-01-31', account: account_02, price: 190_100 },
    { date_of_onset: '2019-01-31', account: account_03, price: -30_890 },
    { date_of_onset: '2019-01-31', account: account_11, price: 320_000 },
    { date_of_onset: '2019-01-31', account: account_12, price: 211_000 },
    { date_of_onset: '2019-01-31', account: account_21, price: 101_020 },
    { date_of_onset: '2019-01-31', account: account_22, price: 501_100 },
    { date_of_onset: '2019-01-31', account: account_23, price: 142_000 },

    { date_of_onset: '2019-02-28', account: account_01, price: 4_201 },
    { date_of_onset: '2019-02-28', account: account_02, price: 34_100 },
    { date_of_onset: '2019-02-28', account: account_03, price: -120_000 },
    { date_of_onset: '2019-02-28', account: account_11, price: 321_000 },
    { date_of_onset: '2019-02-28', account: account_12, price: 211_000 },
    { date_of_onset: '2019-02-28', account: account_21, price: 102_020 },
    { date_of_onset: '2019-02-28', account: account_22, price: 502_100 },
    { date_of_onset: '2019-02-28', account: account_23, price: 143_000 },

    { date_of_onset: '2019-12-31', account: account_01, price: 3_201 },
    { date_of_onset: '2019-12-31', account: account_02, price: 150_222 },
    { date_of_onset: '2019-12-31', account: account_03, price: -60_390 },
    { date_of_onset: '2019-12-31', account: account_11, price: 320_000 },
    { date_of_onset: '2019-12-31', account: account_12, price: 200_000 },
    { date_of_onset: '2019-12-31', account: account_21, price: 100_000 },
    { date_of_onset: '2019-12-31', account: account_22, price: 500_000 },
    { date_of_onset: '2019-12-31', account: account_23, price: 140_000 }
  ]
)
