require 'rails_helper'

RSpec.describe Message, type: :model do
  describe '#create' do #テストの定義・説明文
    context "messageを保存できる場合" do #Terminalで表示される説明
      it "contentがあれば保存できること " do #
        expect(build(:message, image: nil)).to be_valid # 評価する式 エクスペクテーション  to~の後の記述はマッチャ＝成功の条件
      end
      it 'imageがあれば保存できること' do
        expect(build(:message, body: nil)).to be_valid #
      end
      it 'content と imageがあれば保存できること' do
        expect(build(:message)).to be_valid
      end
    end

    context 'messageを保存できない場合' do
      it ' content と imageが両方空だと保存できないこと' do
        message = build(:message, body: nil, image: nil)
        message.valid?
        expect(message.errors[:body]).to include("を入力してください")
      end

      it 'group_idが無いと保存できないこと' do
        message = build(:message, group_id: nil)
        message.valid?
        expect(message.errors[:group]).to include("を入力してください")
      end

      it ' user_idが無いと保存できないこと' do
        message = build(:message, user_id: nil)
        message.valid?
        expect(message.errors[:user]).to include("を入力してください")
      end
    end
  end
end

# valid?メソッド
# valid?メソッドを利用すると、ActiveRecord::Baseを継承しているクラスのインスタンスを保存する際に「バリデーションにより保存ができない状態であるか」を確かめることができます。

# errorsメソッド
# valid？メソッドの返り値はtrue/falseですが、valid?メソッドを利用したインスタンスに対してerrorsメソッドを利用すると、バリデーションにより保存ができない状態である場合なぜできないのかを確認することができます。

# includeマッチャ
# includeマッチャは、引数にとった値がexpectの引数である配列に含まれているかをチェックすることができるマッチャです。

# 今回の場合、「nicknameが空の場合はcan't be blankというエラーが出るはずだ」ということがわかっているため、include("can't be blank")のように書くことができます。

# buildメソッド
# 引数にシンボル型で取ったクラス名のインスタンスを、factory_botの記述をもとに作成します。例えば前述のusers.rbが存在する場合、下記2つの変数userの値は同じ値になります。

# createメソッド
# buildとほぼ同じ働きをしますが、createの場合はテスト用のDBに値が保存されます。

# be_validマッチャ
# expectの引数にしたインスタンスが全てのバリデーションをクリアする場合にパスするマッチャです。

# response
# example内でリクエストが行われた後の遷移先のビューの情報を持つインスタンスです。

# render_templateマッチャ
# 引数(ひきすう)にシンボル型でアクション名を取ります。引数で指定したアクションがリクエストされた時に自動的に遷移するビューを、返します

# assignsメソッド
# コントローラーのテスト時、アクションで定義しているインスタンス変数をテストするためのメソッドです。
# 引数に、直前でリクエストしたアクション内で定義されているインスタンス変数をシンボル型で取ります

# create_list
# factory_botの設定ファイルに存在しているリソースを複数作成したい場合に以下のように利用できます

# matchマッチャ
# 引数に配列クラスのインスタンスをとり、expectの引数と比較するマッチャです。配列の中身の順番までチェックします。