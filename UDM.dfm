object DM: TDM
  OldCreateOrder = False
  Height = 286
  Width = 480
  object FDConnection1: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\vinic\Documents\Embarcadero\Studio\Projects\Ap' +
        'pGestorSenhas\bd\bd.db'
      'LockingMode=Normal'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    AfterConnect = FDConnection1AfterConnect
    BeforeConnect = FDConnection1BeforeConnect
    Left = 40
    Top = 24
  end
  object FDQlogin: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from login')
    Left = 120
    Top = 24
    object FDQloginsenha: TStringField
      FieldName = 'senha'
      Origin = 'senha'
      Size = 15
    end
  end
  object FDQsenha: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from senha order by favorito')
    Left = 200
    Top = 24
    object FDQsenhaid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDQsenhadescricao: TStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Required = True
      Size = 30
    end
    object FDQsenhasenha: TStringField
      FieldName = 'senha'
      Origin = 'senha'
      Required = True
      Size = 15
    end
    object FDQsenhafavorito: TStringField
      FieldName = 'favorito'
      Origin = 'favorito'
      FixedChar = True
      Size = 1
    end
    object FDQsenhalogin: TStringField
      FieldName = 'login'
      Origin = 'login'
      Size = 50
    end
  end
  object FDQCartao: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from cartao')
    Left = 296
    Top = 24
    object FDQCartaoid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDQCartaonome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 30
    end
    object FDQCartaonumero: TStringField
      FieldName = 'numero'
      Origin = 'numero'
      Required = True
      Size = 16
    end
    object FDQCartaocvv: TIntegerField
      FieldName = 'cvv'
      Required = True
    end
    object FDQCartaofavorito: TStringField
      FieldName = 'favorito'
      Origin = 'favorito'
      FixedChar = True
      Size = 1
    end
    object FDQCartaodatavalida: TStringField
      FieldName = 'datavalida'
      Origin = 'datavalida'
      Required = True
      FixedChar = True
      Size = 7
    end
  end
  object FDQFavoritos: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'select 1 as tipo, senha.id, descricao, login, favorito from senh' +
        'a '
      'where favorito = '#39'S'#39
      'union'
      
        'select 2  as tipo, cartao.id, nome, numero, favorito from cartao' +
        ' '
      'where favorito = '#39'S'#39)
    Left = 88
    Top = 104
    object FDQFavoritosid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDQFavoritosdescricao: TStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Required = True
      Size = 30
    end
    object FDQFavoritoslogin: TStringField
      FieldName = 'login'
      Origin = 'login'
      Size = 50
    end
    object FDQFavoritostipo: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'tipo'
      Origin = 'tipo'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
    object FDQFavoritosfavorito: TStringField
      FieldName = 'favorito'
      Origin = 'favorito'
      FixedChar = True
      Size = 1
    end
  end
end
