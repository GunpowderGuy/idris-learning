module State

%default total

export
record Bola where
  constructor Bolac
  x : Integer
  y : Integer
  vecx : Integer
  vecy : Integer

export
record State where
  constructor Statec
  limitX: Integer
  limitY: Integer
  pelota: Bola

initi = Statec 15 15 (Bolac 2 2 1 1)

rebota : State -> Bola
rebota estado =
    let neobola : Bola = estado.pelota
        vx := neobola.vecx * castb ( neobola.x <= estado.limitX && neobola.x >= 1)
        vy := neobola.vecy * castb (neobola.y <= estado.limitY && neobola.y >= 1)
      in
      { vecx := vx , vecy := vy } neobola
      where
      castb : Bool -> Integer
      castb False = -1
      castb True = 1

mover : Bola -> Bola
mover bola = { x := bola.x + bola.vecx, y := bola.y + bola.vecy } bola

export
update : State -> State
update estado = { pelota := (mover . rebota) estado } estado -- why do i need paranthesis for function composition?

export
coordinates : State -> Pair Integer Integer
coordinates estado = MkPair estado.pelota.x estado.pelota.y

--rebotar : Bola -> Bola
--rebotar bola = { x := bola.x + bola.vecx * bola.x, y := bola.y + bola.vecy * bola.y } bola