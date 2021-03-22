# frozen_string_literal: true

json.array! @mailings, partial: 'mailings/mailing', as: :mailing
