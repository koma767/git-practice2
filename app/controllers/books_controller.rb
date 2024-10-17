class BooksController < ApplicationController
  def top
    @book = Book.find(params[:id])
    @book = Book.new


  end



  def create
    @books = Book.all
    @book = Book.new(book_params)
    # １.&2. データを受け取り新規登録するためのインスタンス作成

    # 3. データをデータベースに保存するためのsaveメソッド実行

    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book)
    else
      # 3. フラッシュメッセージを定義し、new.html.erbを描画する
      flash.now[:notice] = "投稿に失敗しました。"
      render :index
    end
  end

  def index
    @books = Book.all
    @book= Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])


  end

  def update

     # １. データを受け取り新規登録するためのインスタンス作成
    @book = Book.find(params[:id])
    # 2. データをデータベースに保存するためのsaveメソッド実行
    if @book.update(book_params)
      # 3. フラッシュメッセージを定義し、詳細画面へリダイレクト
      flash[:notice] = "Book was successfully updated."

      redirect_to book_path(@book)
    else
      render :edit
    end



  end

  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to index_book_path  # 投稿一覧画面へリダイレクト
  end





  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
