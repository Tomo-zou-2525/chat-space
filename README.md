# README

## usersテーブル

|Column|Type|options|
|----|-----|------|
|name|string|null: false|
|email|string|null: false|
|password|integer|null: false|

### Association
- has_many :groups, through:  :groups_users
- has_many :groups_users
- has_many :messages

## massagesテーブル

|Column|Type|options|
|------|----|-------|
|body|text|
|image|string|
|user_id|integer|null: false,  foreign_key: true|
|group_id|integer|null: false,  foreign_key: true|

### Association
- belongs_to :user
- belongs_to :group

## groupsテーブル

|Column|Type|options|
|------|----|-------|
|name|string|null: false|


### Association
- has_many :users, through:  :groups_users
- has_many :groups_users
- has_many :messages

## groups_userテーブル

|Column|Type|options|
|------|----|-------|
|user_id|integer|null: false,  foreign_key: true|
|group_id|integer|null: false,  foreign_key: true|

### Association
- belongs_to :user
- belongs_to :group

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
