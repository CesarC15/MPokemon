MACHINE
MPokemon
SETS
    CARDS = {
             //POKEMON
             CHARMANDER, CHARMELEON, CHARIZARD,
             SQUIRTLE, WARTORTLE, BLASTOISE,
             BULBASAUR, IVYSAUR, VENUSAUR,
             PIKACHU, RAICHU, SNORLAX, EEVEE,
             VAPOREON, FLAREON, JOLTEON,
             //ENERGY
             FIRE_ENERGY, WATER_ENERGY, GRASS_ENERGY,
             ELECTRIC_ENERGY, COLORLESS_ENERGY,
             //SUPPORTER
             POTION, PROFESSOR_RESEARCH
    } ;  
//    POKEMON = {CHARMANDER, CHARMELEON, CHARIZARD,
//               SQUIRTLE, WARTORTLE, BLASTOISE,
//               BULBASAUR, IVYSAUR, VENUSAUR,
//               PIKACHU, RAICHU, SNORLAX, EEVEE,
//               VAPOREON, FLAREON, JOLTEON      
//    } ;
    FIELD = {ACTIVE_P1, BENCH1_P1, BENCH2_P1, BENCH3_P1,
             ACTIVE_P2, BENCH1_P2, BENCH2_P2, BENCH3_P2
    } ;
    TYPES = {FIRE, WATER, GRASS, ELECTRIC, COLORLESS} ;
//    SUPPORTERS = {POTION, PROFESSOR_RESEARCH}
    PLAYERS = {P1, P2} ;
    PHASES = {SHUFFLING, PLACING_ACTIVE, PLAYING}
    
CONSTANTS
    POKEMON,
    BASICS, 
    ENERGY,
    SUPPORTER,
    MAX_HEALTH,
    PRE_EVOLUTION,
    POKEMON_TYPE,
    WEAKNESS,
    DAMAGE,
    ATTACK_COST,
    RETREAT_COST,
    PLAYER_FIELD,
    ACTIVE,
    BENCH,
    ENERGY_TYPE,
    OPPONENT,
    HAND_SIZE,
    DECK_SIZE,
    DECK1,
    DECK2,
    DECK3,
    DECK4
    
PROPERTIES
    POKEMON = {CHARMANDER, CHARMELEON, CHARIZARD,
               SQUIRTLE, WARTORTLE, BLASTOISE,
               BULBASAUR, IVYSAUR, VENUSAUR,
               PIKACHU, RAICHU, SNORLAX, EEVEE,
               VAPOREON, FLAREON, JOLTEON      
    }
    & ENERGY = { FIRE_ENERGY, WATER_ENERGY, GRASS_ENERGY,
                 ELECTRIC_ENERGY, COLORLESS_ENERGY
    }
    & SUPPORTER = {POTION, PROFESSOR_RESEARCH}
    & POKEMON \/ ENERGY \/ SUPPORTER = CARDS
    & POKEMON /\ ENERGY = {}
    & POKEMON /\ SUPPORTER = {}
    & ENERGY /\ SUPPORTER = {}
    & MAX_HEALTH : POKEMON --> NAT
    & PRE_EVOLUTION : POKEMON +-> POKEMON
    & POKEMON_TYPE : POKEMON --> TYPES
    & WEAKNESS : TYPES +-> TYPES
    & DAMAGE : POKEMON --> NAT
    & PLAYER_FIELD : PLAYERS --> POW(FIELD)
    & ACTIVE : PLAYERS --> FIELD
    & BENCH : PLAYERS --> POW(FIELD)
    & ENERGY_TYPE : ENERGY >->> TYPES
    & OPPONENT : PLAYERS >->> PLAYERS
    & HAND_SIZE : NAT1
    & DECK_SIZE : NAT1
    & HAND_SIZE = 5
    & DECK_SIZE = 30
    & DECK_SIZE >= HAND_SIZE   
    & MAX_HEALTH = {CHARMANDER |-> 60, CHARMELEON |-> 90, CHARIZARD |-> 150,
                  SQUIRTLE |-> 60, WARTORTLE |-> 90, BLASTOISE |-> 150,
                  BULBASAUR |-> 60, IVYSAUR |-> 90, VENUSAUR |-> 160,
                  PIKACHU |-> 60, RAICHU |-> 120, SNORLAX |-> 120, EEVEE |-> 50,
                  VAPOREON |-> 130, FLAREON |-> 120, JOLTEON |-> 110
    }
    & PRE_EVOLUTION = {CHARIZARD |-> CHARMELEON, CHARMELEON |-> CHARMANDER,
                       BLASTOISE |-> WARTORTLE, WARTORTLE |-> SQUIRTLE,
                       VENUSAUR |-> IVYSAUR, IVYSAUR |-> BULBASAUR,
                       RAICHU |-> PIKACHU, VAPOREON |-> EEVEE, 
                       FLAREON |-> EEVEE, JOLTEON |-> EEVEE
    }
    & BASICS = POKEMON - dom(PRE_EVOLUTION)
    & POKEMON_TYPE = {CHARMANDER |-> FIRE, CHARMELEON |-> FIRE, CHARIZARD |-> FIRE,
                  SQUIRTLE |-> WATER, WARTORTLE |-> WATER, BLASTOISE |-> WATER,
                  BULBASAUR |-> GRASS, IVYSAUR |-> GRASS, VENUSAUR |-> GRASS,
                  PIKACHU |-> ELECTRIC, RAICHU |-> ELECTRIC, SNORLAX |-> COLORLESS, EEVEE |-> COLORLESS,
                  VAPOREON |-> WATER, FLAREON |-> FIRE, JOLTEON |-> ELECTRIC
    }
    & WEAKNESS = {FIRE |-> WATER, WATER |-> GRASS, GRASS |-> FIRE}
    & DAMAGE = {CHARMANDER |-> 30, CHARMELEON |-> 50, CHARIZARD |-> 100,
                  SQUIRTLE |-> 20, WARTORTLE |-> 60, BLASTOISE |-> 90,
                  BULBASAUR |-> 20, IVYSAUR |-> 50, VENUSAUR |-> 100,
                  PIKACHU |-> 30, RAICHU |-> 90, SNORLAX |-> 80, EEVEE |-> 20,
                  VAPOREON |-> 80, FLAREON |-> 90, JOLTEON |-> 100
    }
    & ATTACK_COST = {CHARMANDER |-> 2, CHARMELEON |-> 2, CHARIZARD |-> 3,
                  SQUIRTLE |-> 1, WARTORTLE |-> 3, BLASTOISE |-> 3,
                  BULBASAUR |-> 1, IVYSAUR |-> 2, VENUSAUR |-> 3,
                  PIKACHU |-> 1, RAICHU |-> 2, SNORLAX |-> 3, EEVEE |-> 1,
                  VAPOREON |-> 2, FLAREON |-> 2, JOLTEON |-> 2
    }
    & RETREAT_COST = ATTACK_COST
    & BENCH = {P1 |-> {BENCH1_P1, BENCH2_P1, BENCH3_P1},
               P2 |-> {BENCH1_P2, BENCH2_P2, BENCH3_P2}}
    & ACTIVE = {P1 |-> ACTIVE_P1, P2 |-> ACTIVE_P2}
    & PLAYER_FIELD = {pp, ff | pp : PLAYERS & ff = BENCH(pp) \/ {ACTIVE(pp)}}
    & ENERGY_TYPE = { FIRE_ENERGY |-> FIRE, WATER_ENERGY |-> WATER, GRASS_ENERGY |-> GRASS,
                 ELECTRIC_ENERGY |-> ELECTRIC, COLORLESS_ENERGY |-> COLORLESS
    }
    & OPPONENT = {P1 |-> P2, P2 |-> P1}
    & DECK1 : seq(CARDS)
    & DECK1 = [CHARMANDER, FIRE_ENERGY, POTION, FIRE_ENERGY, CHARMELEON, FIRE_ENERGY, PROFESSOR_RESEARCH, FIRE_ENERGY, CHARIZARD, COLORLESS_ENERGY, CHARMANDER, FIRE_ENERGY, FLAREON, FIRE_ENERGY, CHARMELEON, POTION, FIRE_ENERGY, EEVEE, CHARMANDER, FIRE_ENERGY, PROFESSOR_RESEARCH, CHARIZARD, FIRE_ENERGY, COLORLESS_ENERGY, CHARMANDER, POTION, FIRE_ENERGY, CHARMELEON, PROFESSOR_RESEARCH, FIRE_ENERGY]
    & DECK2 : seq(CARDS)
    & DECK2 = [SQUIRTLE, WATER_ENERGY, POTION, WATER_ENERGY, WARTORTLE, COLORLESS_ENERGY, WATER_ENERGY, PROFESSOR_RESEARCH, BLASTOISE, WATER_ENERGY, EEVEE, COLORLESS_ENERGY, WATER_ENERGY, SQUIRTLE, SNORLAX, WATER_ENERGY, WARTORTLE, POTION, WATER_ENERGY, VAPOREON, COLORLESS_ENERGY, WATER_ENERGY, SQUIRTLE, PROFESSOR_RESEARCH, BLASTOISE, WATER_ENERGY, COLORLESS_ENERGY, WARTORTLE, WATER_ENERGY, WATER_ENERGY]
    & DECK3 : seq(CARDS)
    & DECK3 = [BULBASAUR, GRASS_ENERGY, POTION, GRASS_ENERGY, IVYSAUR, COLORLESS_ENERGY, GRASS_ENERGY, PROFESSOR_RESEARCH, VENUSAUR, GRASS_ENERGY, SNORLAX, GRASS_ENERGY, BULBASAUR, POTION, GRASS_ENERGY, IVYSAUR, COLORLESS_ENERGY, GRASS_ENERGY, BULBASAUR, GRASS_ENERGY, SNORLAX, VENUSAUR, GRASS_ENERGY, POTION, BULBASAUR, COLORLESS_ENERGY, GRASS_ENERGY, IVYSAUR, PROFESSOR_RESEARCH, GRASS_ENERGY]
    & DECK4 : seq(CARDS)
    & DECK4 = [PIKACHU, ELECTRIC_ENERGY, POTION, ELECTRIC_ENERGY, RAICHU, ELECTRIC_ENERGY, PROFESSOR_RESEARCH, ELECTRIC_ENERGY, EEVEE, COLORLESS_ENERGY, PIKACHU, ELECTRIC_ENERGY, JOLTEON, ELECTRIC_ENERGY, RAICHU, POTION, ELECTRIC_ENERGY, PIKACHU, ELECTRIC_ENERGY, PROFESSOR_RESEARCH, EEVEE, ELECTRIC_ENERGY, PIKACHU, ELECTRIC_ENERGY, JOLTEON, RAICHU, ELECTRIC_ENERGY, PROFESSOR_RESEARCH, PIKACHU, ELECTRIC_ENERGY]
    & !dk.(dk : {DECK1,DECK2,DECK3,DECK4} => size(dk) = DECK_SIZE & ran(dk) /\ BASICS /= {}) //Todo deck é do tamanho do deck size e tem pelo menos 1 basico
    & !pk . (pk : dom(PRE_EVOLUTION) => MAX_HEALTH(PRE_EVOLUTION(pk)) <= MAX_HEALTH(pk)) // evolucao nunca tem vida menor que a pre
  
VARIABLES    
    curr_health,
    field_position,
    newly_placed,
    energy_map,
    energy_played,
    current_turn,
    points,
    player_deck,
    player_hand,
    can_play,
    game_ended,
    phase,
    supporter_played,
    retreated
INVARIANT
    curr_health : FIELD +-> NAT
    & field_position : FIELD +-> POKEMON
    & newly_placed : FIELD --> BOOL
    & energy_map : FIELD --> seq(TYPES)
    & energy_played : BOOL
    & current_turn : PLAYERS
    & points : PLAYERS --> NAT
    & player_deck : PLAYERS --> seq(CARDS)
    & player_hand : PLAYERS --> seq(CARDS)
    & can_play : BOOL
    & game_ended : BOOL
    & phase : PHASES
    //& game_ended = FALSE Achar contra exemplo automaticamente no ProB, tirar depois
    & dom(curr_health) = dom(field_position)
    & ! ff . (ff : dom(curr_health) => curr_health(ff) <= (field_position ; MAX_HEALTH)(ff)) // Para cada posição que tá no campo, a vida daquela posição é menor igual a vida máxima do pokémon de lá
    & ! ff . (ff : (FIELD - dom(field_position)) => newly_placed(ff) = FALSE) // Para cada posição, se não tem pokémon, newly_placed daquela posição é FALSE
    & ! (ff) . ((ff : (FIELD - dom(field_position))) => energy_map(ff) = [])
    & ! pp . (pp : PLAYERS => points(pp) <= 3)
    & supporter_played : BOOL
    & retreated : BOOL
    
INITIALISATION
    curr_health := {}
    || field_position := {}
    || newly_placed := {ff, bb | ff : FIELD & bb = FALSE}
    || energy_map := FIELD * {[]}
    || energy_played := FALSE
    || current_turn := P1
    || can_play := TRUE
    || game_ended := FALSE
    || phase := SHUFFLING
    || points := {P1 |-> 0, P2 |-> 0}
    || player_deck := {P1 |-> [], P2 |-> []}
    || player_hand := {P1 |-> [], P2 |-> []}
    || supporter_played := FALSE
    || retreated := FALSE
    
OPERATIONS
    

    set_deck (pp, dd) =
    PRE
        pp : PLAYERS 
        & dd : {DECK1, DECK2, DECK3, DECK4}
        & size(player_deck(pp)) < DECK_SIZE
        & phase = SHUFFLING
    THEN
        player_deck(pp) := dd
    END
    ;
    
    vv <-- victory(pp) =
    PRE
        pp : PLAYERS
        & (points(pp) >= 3 //Player fez 3 pontos
           //Adversario não pode mais comprar carta
           or (pp = current_turn & player_deck(OPPONENT(pp)) = [])
           //Adversario não tem mais pokemons no campo
           or (dom(field_position) /\ PLAYER_FIELD(OPPONENT(pp)) = {})
       )
       & game_ended = FALSE
       & phase = PLAYING
    THEN
        game_ended := TRUE
        || vv := pp
    END
    ;
    
    shuffle_decks = 
    PRE
        phase = SHUFFLING
        & size(player_deck(P1)) = DECK_SIZE
        & size(player_deck(P2)) = DECK_SIZE
    THEN
        ANY
            h1, h2, d1, d2
        WHERE 
            h1 : iseq(dom(player_deck(P1))) 
            & size(h1) = HAND_SIZE
            & !ii.(ii : 1..HAND_SIZE-1 => h1(ii) < h1(ii+1)) //Ordem crescente, só para tirar opção identica do prob
            & BASICS /\ ran(h1 ; player_deck(P1)) /= {} //Tem pelo menos 1 basico
            & d1 : iseq(dom(player_deck(P1)))
            & size(d1) = DECK_SIZE - HAND_SIZE
            & ran(d1) = dom(player_deck(P1)) - ran(h1) //Deck é o que sobrou depois de tirar a mão
            & !ii.(ii : 1..size(d1)-1 => d1(ii) < d1(ii+1)) //Só para tirar opção identica do prob
            
            //Mesma coisa só que pro P2
            & h2 : iseq(dom(player_deck(P2))) 
            & size(h2) = HAND_SIZE
            & !ii.(ii : 1..HAND_SIZE-1 => h2(ii) < h2(ii+1))
            & BASICS /\ ran(h2 ; player_deck(P2)) /= {}
            & d2 : iseq(dom(player_deck(P2)))
            & size(d2) = DECK_SIZE - HAND_SIZE
            & ran(d2) = dom(player_deck(P2)) - ran(h2)
            & !ii.(ii : 1..size(d2)-1 => d2(ii) < d2(ii+1))
        THEN
            player_hand := {
                P1 |-> (h1 ; player_deck(P1)),
                P2 |-> (h2 ; player_deck(P2))
            }
            || player_deck := {
                P1 |-> (d1 ; player_deck(P1)),
                P2 |-> (d2 ; player_deck(P2))
            }
            
            || phase := PLACING_ACTIVE
            

        END
    END
    ;
    
    place_active(pp, ii) =
    PRE
        pp : PLAYERS
        & ii : NAT
        & ii : dom(player_hand(pp))
        & player_hand(pp)(ii) : BASICS //Pokemon basico
        & phase = PLACING_ACTIVE
        & ACTIVE(pp) /: dom(field_position) //Não pode já ter escolhido
    THEN
        field_position(ACTIVE(pp)) := player_hand(pp)(ii)
        || curr_health(ACTIVE(pp)) := MAX_HEALTH(player_hand(pp)(ii)) 
        || player_hand(pp) := (player_hand(pp) /|\ (ii-1)) ^ (player_hand(pp) \|/ ii)
        || newly_placed(ACTIVE(pp)) := TRUE 
    END
    ;
    
    finish_setup =
    PRE
        phase = PLACING_ACTIVE
        & ACTIVE(P1) : dom(field_position)
        & ACTIVE(P2) : dom(field_position)
    THEN
        phase := PLAYING
    END
    ;
    
    end_turn =
    PRE
        //Adversario ainda tem carta para comprar
        size(player_deck(OPPONENT(current_turn))) > 0
        //Adversario tem que escolher um novo pokemon para colocar como ativo
        & ACTIVE(OPPONENT(current_turn)) : dom(field_position)
        //Jogador não ganhou por pontos
        & points(current_turn) < 3
        & game_ended = FALSE
        & phase = PLAYING
    THEN
        LET opponent 
        BE opponent = OPPONENT(current_turn) 
        IN
            ANY idx WHERE
                idx : 1..size(player_deck(opponent))
            THEN
                current_turn := opponent
                || player_hand(opponent) := player_hand(opponent) <- player_deck(opponent)(idx)
                || player_deck(opponent) := (player_deck(opponent) /|\ (idx - 1)) ^ (player_deck(opponent) \|/ idx)
            END
        END
        
        || IF current_turn = P1 THEN newly_placed := newly_placed <+ {ACTIVE_P1 |-> FALSE, BENCH1_P1 |-> FALSE, BENCH2_P1 |-> FALSE, BENCH3_P1 |-> FALSE} 
            ELSE newly_placed := newly_placed <+ {ACTIVE_P2 |-> FALSE, BENCH1_P2 |-> FALSE, BENCH2_P2 |-> FALSE, BENCH3_P2 |-> FALSE}
            END 
        
        || can_play := TRUE
        || supporter_played := FALSE
        || energy_played := FALSE
        || retreated := FALSE
    END
    ;
    
    replace_active(ff) =
    PRE
        //Tem que ter um pokemon no espaço no banco que ele quer colocar como ativo
        ff: FIELD
        & ff : (BENCH(OPPONENT(current_turn)))
        & ff : dom(field_position)
        //Não tem ninguem no ativo
        & ACTIVE(OPPONENT(current_turn)) /: dom(field_position) 
        //Só acontece depois de um ataque, então ninguem pode jogar pelo resto desse turno
        & can_play = FALSE
        & game_ended = FALSE
        & phase = PLAYING
    THEN
        LET act BE act = ACTIVE(OPPONENT(current_turn)) 
        IN
            field_position := ({ff} <<| field_position) <+ {act |-> field_position(ff)} // remove do campo a posição do banco que liberou agr e insere o poke no ativo
            || curr_health := ({ff} <<| curr_health) <+ {act |-> curr_health(ff)}
            || energy_map := energy_map <+ {act |-> energy_map(ff), ff |-> []}
            || newly_placed := newly_placed <+ {act |-> newly_placed(ff), ff |-> FALSE}
        END
            
    END
    ;
    
    play_card(ii, ff) = //Jogar carta pela posição na mão
    PRE
        ii : NAT
        & ii : dom(player_hand(current_turn))
        & ff : FIELD
        & ff : PLAYER_FIELD(current_turn)
        & can_play = TRUE
        & game_ended = FALSE
        & phase = PLAYING
        & !cc . ( (cc : CARDS & cc = player_hand(current_turn)(ii)) =>
            (
                // apenas 1 energia
                (cc : ENERGY => ff : dom(field_position) & energy_played = FALSE)
    
                // pokemon basico vai para o banco
                & (cc : BASICS => (ff : BENCH(current_turn) & ff /: dom(field_position)))
    
                // pra poder evoluir tem que ser a pré e não pode ter sido recém jogado
                & (cc : dom(PRE_EVOLUTION) => (ff : dom(field_position) & field_position(ff) = PRE_EVOLUTION(cc) & newly_placed(ff) = FALSE))
    
                & (cc = POTION => (ff : dom(field_position) & curr_health(ff) < MAX_HEALTH(field_position(ff))))
    
                // prof research não tem alvo (aí por isso foi colocado ACTIVE pra ser um dummy) e o deck é não vazio
                & (cc = PROFESSOR_RESEARCH => (ff = ACTIVE(current_turn) & size(player_deck(current_turn)) > 0))
    
                // apenas 1 supporter por turno
                & (cc : SUPPORTER => supporter_played = FALSE)
            ))
    THEN
        LET cc, hand_resto BE
            cc = player_hand(current_turn)(ii)
            & hand_resto = (player_hand(current_turn) /|\ (ii - 1)) ^ (player_hand(current_turn) \|/ ii) // mão sem carta jogada
        IN
            IF cc : ENERGY THEN
                energy_map(ff) := energy_map(ff) <- ENERGY_TYPE(cc)
                || player_hand(current_turn) := hand_resto
                || energy_played := TRUE
                
            ELSIF cc : BASICS THEN // basico
                field_position(ff) := cc
                || curr_health(ff) := MAX_HEALTH(cc)
                || newly_placed(ff) := TRUE
                || player_hand(current_turn) := hand_resto
    
            ELSIF cc : dom(PRE_EVOLUTION) THEN
                field_position(ff) := cc
                || curr_health(ff) := curr_health(ff) + (MAX_HEALTH(cc) - MAX_HEALTH(field_position(ff))) // mantem dano na evolução
                || newly_placed(ff) := TRUE
                || player_hand(current_turn) := hand_resto
    
            ELSIF cc = POTION THEN
                curr_health(ff) := min({curr_health(ff) + 50, MAX_HEALTH(field_position(ff))})
                || supporter_played := TRUE
                || player_hand(current_turn) := hand_resto
    
            ELSE /// professor carvo
                LET deck BE deck = player_deck(current_turn) IN
                    IF size(deck) >= 2 THEN
                        ANY i2, jj WHERE
                            i2 : 1..size(deck)
                            & jj : 1..size(deck)
                            & i2 < jj
                        THEN
                            player_hand(current_turn) := hand_resto ^ [deck(i2), deck(jj)]
                            || player_deck(current_turn) := (deck /|\ (i2 - 1)) ^ ((deck /|\ (jj - 1)) \|/ i2) ^ (deck \|/ jj)
                            || supporter_played := TRUE
                        END
                    ELSIF size(deck) = 1 THEN
                        player_hand(current_turn) := hand_resto ^ [deck(1)]
                        || player_deck(current_turn) := []
                        || supporter_played := TRUE
                    ELSE //Nunca deve chegar por causa da pré condição, mas vai que
                        player_hand(current_turn) := hand_resto
                        || supporter_played := TRUE
                    END
                END
            END
        END
    END
    ;
    
    attack =
    PRE
        // pode jogar e nao acabou
        can_play = TRUE
        & game_ended = FALSE
        & phase = PLAYING
        & points(current_turn) < 3
        // oponente tem pokemon ativo
        & ACTIVE(OPPONENT(current_turn)) : dom(field_position)
        // tem pokemon ativo
        & ACTIVE(current_turn) : dom(field_position)
        // tem quantidade de energia do tipo suficiente 
        & card( energy_map(ACTIVE(current_turn)) |> {POKEMON_TYPE(field_position(ACTIVE(current_turn)))} ) >=          
                                                            ATTACK_COST(field_position(ACTIVE(current_turn)))
    THEN
        can_play := FALSE
        || LET act BE act = ACTIVE(current_turn) IN
            LET def BE def = ACTIVE(OPPONENT(current_turn)) IN
                ANY dmg WHERE 
                    dmg : NAT 
                    // defensor é fraco
                    & ((
                         POKEMON_TYPE(field_position(def)) : dom(WEAKNESS) 
                         & WEAKNESS(POKEMON_TYPE(field_position(def))) = POKEMON_TYPE(field_position(act))
                        ) 
                        => dmg = DAMAGE(field_position(act)) * 2 
                    )
                        
                    // defensor é neutro
                    & (not(
                            POKEMON_TYPE(field_position(def)) : dom(WEAKNESS) 
                            & WEAKNESS(POKEMON_TYPE(field_position(def))) = POKEMON_TYPE(field_position(act))
                        ) 
                        => dmg = DAMAGE(field_position(act)) )
                THEN
                    
                    
                    IF dmg >= curr_health(def) THEN // se pokemon morreu
                        // retira ele da posição, retira a vida, zera as energias e adiciona um ponto
                        field_position:= {def} <<| field_position
                        || curr_health := {def} <<| curr_health
                        || energy_map(def) := []
                        || newly_placed(def) := FALSE
                        || points(current_turn) := points(current_turn) + 1
                        
                    ELSE
                        //se sobreviveu só retira a vida
                        curr_health := curr_health <+ {def |-> (curr_health(def) - dmg)}
                    END
                END
            END
        END
    END
    ;
    
    retreat(ff) =
    PRE
        ff : FIELD
        & ACTIVE(current_turn) : dom(field_position)
        & ff : dom(field_position)
        & ff : BENCH(current_turn)
        & can_play = TRUE
        & game_ended = FALSE
        & retreated = FALSE
        & phase = PLAYING
        & size(energy_map(ACTIVE(current_turn))) >= RETREAT_COST(field_position(ACTIVE(current_turn)))
    THEN
        retreated := TRUE
        // colocar o pokemon no banco selecionado
        || LET act BE act = ACTIVE(current_turn) IN

            // troca as posições
            field_position := field_position <+ {
                act |-> field_position(ff),
                ff  |-> field_position(act)
            }
            
            // troca a vida
            || curr_health := curr_health <+ {
                act |-> curr_health(ff),
                ff  |-> curr_health(act)
            }
            
            // troca regra de evolução
            || newly_placed := newly_placed <+ {
                act |-> newly_placed(ff),
                ff |-> newly_placed(act)
            }
            
            // troca as energias e retira as ultimas energias jogadas
            || energy_map := energy_map <+ {
                ff |-> (energy_map(act) /|\ (size(energy_map(act)) - RETREAT_COST(field_position(act)))),
                act |-> energy_map(ff)
            }
        END
    END
END