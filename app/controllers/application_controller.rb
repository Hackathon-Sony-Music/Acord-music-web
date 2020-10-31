class ApplicationController < ActionController::Base
  add_flash_types :info, :danger, :warning

  def time_sistem
    Time.now.strftime("%Y/%m/%d_%H:%M:%S")
  end

  # def self.get_avatar_social(cdg_ordem)
  #     tb_digital = RecursoHumanos::TbFotoPessoal.where(cdg_ordem: cdg_ordem).first
  #     if tb_digital.present?
  #       path = "#{Rails.root}/public/avatar_orgao"
  #       Dir.mkdir(path, 0777) unless File.exists?(path)
  #       file = File.open("#{path}/#{cdg_ordem}.jpg", 'wb+')
  #       file.write(tb_digital.foto)
  #       file.close
  #       "/avatar_orgao/#{cdg_ordem}.jpg"
  #     else
  #       AVATAR_URL_DEFAULT
  #     end
  # end

  # Salva image direto no banco da aplicacao
  def save_image(name_file, format_file, id_object, image)
    directory = "#{Rails.root}/app/public/tmp/type_animal/"
    dire_tmp = directory + "#{name_file}_#{id_object}.#{format_file}"
    File.delete(dire_tmp) if File.exist?(dire_tmp)
    path = File.join(directory, "#{name_file}_#{id_object}.#{format_file}")
    File.open(path, "wb") { |f| f.write(image) }
    dire_tmp
  end

  # Retorna uma string no formato de real brasileito
  def formata_valor_real(valor)
    if valor && valor.present?
      number_to_currency(valor, unit: 'R$ ', separator: ',', delimiter: '.')
    else
      number_to_currency(0, unit: 'R$ ', separator: ',', delimiter: '.')
    end
  end

  # Gera o pdf/xml/xls
  def gerar_impressao_format(format, dados, nome_relatorio, nme_layout = "imprimir", orientation = 'Landscape', footer_left = '', footer_center = "#{RODA_PE_PDF}#{time_sistem()}")
    format.pdf do
      html = render_to_string(:action => "#{nme_layout}.html.erb", :layout => false)
      kit = PDFKit.new(html, :orientation => orientation, :print_media_type => true,
                       margin_top: '0.35in', margin_bottom: '0.35in', margin_left: '0.35in', margin_right: '0.35in',
                       :footer_left => footer_left, :footer_center => footer_center, :footer_font_size => '8')
      kit.stylesheets << "#{Rails.root}/app/javascript/stylesheets/app.scss"
      send_data(kit.to_pdf, :filename => "#{nome_relatorio}.pdf", :type => 'application/pdf')
    end

    if params[:format].to_s == 'XLSX'
      request.format = 'xlsx'
      format.xlsx { send_data render_to_string(:action => "#{nme_layout}.xlsx.axlsx", :type => "application/xlsx", :layout => false), :filename => "#{nome_relatorio}.xlsx" }
    end

    format.xml do
      render xml: dados.collect { |dado| remove_keys(dado.to_hash) }
    end

    format.json do
      render json: dados.collect { |dado| remove_keys(dado.to_hash) }
    end

    format.csv { send_data dados.to_csv, :filename => "#{nome_relatorio}.csv", :type => 'text/csv', :disposition => 'attachment' }
  end
end
