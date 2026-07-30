-- Brony source for auto-cmp.nvim
-- I intend to use it mainly for fiction/fimfic writing. 
-- For coding, I exclude this source(aka just comment it out from cmp.config.sources in auto-cmp.lua)

local word_list = {
  -- pony names from hasbro's show
  { label = "TS : Twilight Sparkle", insertText = "Twilight Sparkle"          },
  { label = "RD : Rainbow Dash", insertText = "Rainbow Dash"                  },
  { label = "FS : Fluttershy", insertText = "Fluttershy"                      },
  { label = "RA : Rarity", insertText = "Rarity"                              },
  { label = "AJ : Applejack", insertText = "Applejack"                        },
  { label = "PP : Pinkie Pie", insertText = "Pinkie Pie"                      },
  { label = "SG : Starlight Glimmer", insertText = "Starlight Glimmer"        },
  { label = "TL : Trixie Lulamoon", insertText = "Trixie Lulamoon"            },
  { label = "PC : Princess Celestia", insertText = "Princess Celestia"        },
  { label = "PL : Princess Luna", insertText = "Princess Luna"                },
  { label = "SA : Shining Armor", insertText = "Shining Armor"                },
  { label = "SP : Spike", insertText = "Spike"                                },
  { label = "BM : Big McIntosh", insertText = "Big McIntosh"                  },
  { label = "SB : Sweetie Belle", insertText = "Sweetie Belle"                },
  { label = "AB : Apple Bloom", insertText = "Apple Bloom"                    },
  { label = "SC : Scootaloo", insertText = "Scootaloo"                        },
  { label = "DH : Derpy Hooves", insertText = "Derpy Hooves"                  },
  { label = "DJ : DJ Pon-3", insertText = "DJ Pon-3"                          },
  { label = "LY : Lyra Heartstrings", insertText = "Lyra Heartstrings"        },
  { label = "BB : Bon Bon", insertText = "Bon Bon"                            },
  { label = "QC : Queen Chrysalis", insertText = "Queen Chrysalis"            },
  { label = "DC : Discord", insertText = "Discord"                            },
  { label = "KS : King Sombra", insertText = "King Sombra"                    },
  { label = "CG : Cozy Glow", insertText = "Cozy Glow"                        },
  { label = "SS : Sunset Shimmer", insertText = "Sunset Shimmer"              },
  { label = "OM : Octavia Melody", insertText = "Octavia Melody"              },
  { label = "DW : Doctor Whooves", insertText = "Doctor Whooves"              },
  { label = "MN : Minuette", insertText = "Minuette"                          },
  { label = "TK : Twinkleshine", insertText = "Twinkleshine"                  },
  { label = "LH : Lemon Hearts", insertText = "Lemon Hearts"                  },
  { label = "AS : Amethyst Star", insertText = "Amethyst Star"                },
  { label = "SF : Spitfire", insertText = "Spitfire"                          },
  { label = "SR : Soarin", insertText = "Soarin"                              },
  { label = "BMa : Button Mash", insertText = "Button Mash"                   },
  { label = "FS : Flash Sentry", insertText = "Flash Sentry"                  },
  { label = "CP : Coco Pommel", insertText = "Coco Pommel"                    },
  { label = "CS : Cheese Sandwich", insertText = "Cheese Sandwich"            },
  { label = "MP : Maud Pie", insertText = "Maud Pie"                          },
  -- peak fandom ponies:
  { label = "FP : Fluffle Puff", insertText = "Fluffle Puff"                  },
  { label = "LP : Littlepip", insertText = "Littlepip"                        },
  { label = "NY : Nyx", insertText = "Nyx"                                    },
  { label = "SD : Snowdrop", insertText = "Snowdrop"                          },
  { label = "MW : Milky Way", insertText = "Milky Way"                        },
  { label = "BtM : Button's Mom", insertText = "Button's Mom"                 },
  { label = "AN : Aryanne", insertText = "Aryanne"                            },
  { label = "FC : Fausticorn", insertText = "Fausticorn"                      },
  { label = "AF : Anonfilly", insertText = "Anonfilly"                        },
  -- equestria-related words
  { label = "EQ : Equestria", insertText = "Equestria"                        },
  { label = "Ponyville", insertText = "Ponyville"                             },
  { label = "Canterlot", insertText = "Canterlot"                             },
  { label = "Cloudsdale", insertText = "Cloudsdale"                           },
  { label = "Manehattan", insertText = "Manehattan"                           },
  { label = "Crystal Empire", insertText = "Crystal Empire"                   },
  { label = "Everfree Forest", insertText = "Everfree Forest"                 },
  { label = "Sweet Apple Acres", insertText = "Sweet Apple Acres"             },
  { label = "Our Town", insertText = "Our Town"                               },
  { label = "Las Pegasus", insertText = "Las Pegasus"                         },
  { label = "Baltimare", insertText = "Baltimare"                             },
  { label = "Fillydelphia", insertText = "Fillydelphia"                       },
  { label = "Hollow Shades", insertText = "Hollow Shades"                     },
  { label = "Vanhoover", insertText = "Vanhoover"                             },
  { label = "Dodge Junction", insertText = "Dodge Junction"                   },
  { label = "Appleloosa", insertText = "Appleloosa"                           },
  { label = "Rainbow Falls", insertText = "Rainbow Falls"                     },
  { label = "Ghastly Gorge", insertText = "Ghastly Gorge"                     },
  { label = "Smoky Mountains", insertText = "Smoky Mountains"                 },
  { label = "Mount Aris", insertText = "Mount Aris"                           },
  { label = "Seaquestria", insertText = "Seaquestria"                         },
  { label = "Yakyakistan", insertText = "Yakyakistan"                         },
  { label = "Changeling Kingdom", insertText = "Changeling Kingdom"           },
  { label = "Griffonstone", insertText = "Griffonstone"                       },
  { label = "Tartarus", insertText = "Tartarus"                               },
  { label = "Rockville", insertText = "Rockville"                             },
  -- misc
  { label = "Elements of Harmony", insertText = "Elements of Harmony"         },
  { label = "Cutie Mark", insertText = "Cutie Mark"                           },
  { label = "Cutie Mark Crusaders", insertText = "Cutie Mark Crusaders"       },
  -- fandom-related words
  { label = "BR : Brony", insertText = "Brony"                                },
  { label = "PE : Pegasister", insertText = "Pegasister"                      },
}

local brony_source = {} 

function brony_source:is_available()
  return true
end

-- higher order function is needed to make it possible for async running.
-- it first collects the word_list, and once finished, it executes the callback
function brony_source:complete(request, callback)
  callback({
    items = word_list,
    isIncomplete = false,
  })
end

return brony_source
