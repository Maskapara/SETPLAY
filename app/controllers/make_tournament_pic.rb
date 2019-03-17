require 'cairo'

module MakeTournament

    # nは人数
    def make(n)

        format = Cairo::FORMAT_ARGB32
        width = 2400
        height = 1800

        # トナメ表の各パラメータ
        t_h = height / 10
        t_w = width / 2

        surface = Cairo::ImageSurface.new(format,width,height)
        context = Cairo::Context.new(surface)

        context.set_source_rgb(0,0,0)

        # 描画画像の上を0とした縦margin
        margin_y = 100

        # 人数
        # n = 64

        # 線数
        vertical_line_number = (2 * n) - 1
        horizontal_line_number = n - 1

        # タテ線構築
        for line in 1..vertical_line_number do
            
            center_v = (width / 2)

            # 何段目か
            stage = Math.log2(line).floor

            # stage段目の何番目か
            order = line - (2 ** stage) + 1

            # stage段目の縦線同士の間隔
            order_opponent = t_w / (2 ** (stage - 1))

            # 段に依存した間隔決定
            for interval in 1..stage do
                center_v -= t_w / (2 ** interval).to_f
            end

            postion_x = center_v + (order - 1) * order_opponent

            # プリントデバッグ
            # puts "間隔は#{order_opponent}"
            # puts "#{line}本目の位置は#{postion_x}"

            # タテ線構築
            context.move_to(postion_x,margin_y + stage * t_h)
            context.line_to(postion_x,margin_y + (stage + 1) * t_h)

            # ヨコ線構築
            if (line % 2) == 0
                context.move_to(postion_x,margin_y + stage * t_h)
                context.line_to(postion_x + order_opponent,margin_y + stage * t_h)
            end

        end

        # 描画
        context.stroke

        # ファイル名はユーザ名 + 大会名
        surface.write_to_png("../../share/a.png")
    end

end