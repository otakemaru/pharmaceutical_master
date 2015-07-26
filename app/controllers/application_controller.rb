class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  INPUT_BLANK_ALERT = 'インポートするCSVファイルを選択してください'
  INPUT_NOTICE = '件の情報を追加しました'
  INPUT_DIFFERENT_ALERT = '指定した名称のCSVファイルを選択してください'
  DELETE_ALL_NOTICE = '全件削除しました'
  CREATE_NOTICE = '作成しました'
  UPDATE_NOTICE = '更新しました'
  DELETE_NOTICE = '削除しました'
end
