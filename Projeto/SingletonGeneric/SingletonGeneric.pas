{ ******************************************************* }
{ Classe Genérica para Utilização de Singleton            }
{ ******************************************************* }
unit SingletonGeneric;

interface

type
  TSingleton = class
  private
     class var instance: TSingleton;
  protected

  public
    class function Create: TSingleton;
    destructor Destroy; override;
  end;

implementation

{ TSingleton }

class function TSingleton.Create: TSingleton;
begin
  if (instance = nil) then
    instance:= inherited Create as Self;

  result:= instance;
end;

destructor TSingleton.Destroy;
begin
  instance:= nil;
  inherited;
end;

end.
