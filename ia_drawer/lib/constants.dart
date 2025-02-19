// Defineix les eines/funcions que hi ha disponibles a Flutter
const tools = [
  {
    "type": "function",
    "function": {
      "name": "draw_circle",
      "description":
          "Dibuixa un cercle amb un radi determinat. Si falta el radi, es posa per defecte a 10. Si ha de ser aleatori, es genera entre 10 i 25. Es poden definir dos colors en format hexadecimal: el contorn (`cont_color`) i l'interior (`int_color`). Per defecte tots dos són negres (#000000).",
      "parameters": {
        "type": "object",
        "properties": {
          "x": {"type": "number"},
          "y": {"type": "number"},
          "radius": {"type": "number"},
          "cont_color": {"type": "string", "description": "Color del contorn en hexadecimal (#RRGGBB)."},
          "int_color": {"type": "string", "description": "Color de l'interior en hexadecimal (#RRGGBB)."}
        },
        "required": ["x", "y"]
      }
    }
  },
  {
    "type": "function",
    "function": {
      "name": "draw_line",
      "description":
          "Dibuixa una línia entre dos punts. Si no s'especifica la posició, s'escullen punts aleatoris entre (10,10) i (100,100). Es pot definir el color del contorn (`cont_color`) en format hexadecimal, per defecte negre (#000000).",
      "parameters": {
        "type": "object",
        "properties": {
          "startX": {"type": "number"},
          "startY": {"type": "number"},
          "endX": {"type": "number"},
          "endY": {"type": "number"},
          "cont_color": {"type": "string", "description": "Color del contorn en hexadecimal (#RRGGBB)."}
        },
        "required": []
      }
    }
  },
  {
    "type": "function",
    "function": {
      "name": "draw_rectangle",
      "description":
          "Dibuixa un rectangle definit per les coordenades superior-esquerra i inferior-dreta. Es poden definir dos colors en format hexadecimal: el contorn (`cont_color`) i l'interior (`int_color`). Per defecte tots dos són negres (#000000).",
      "parameters": {
        "type": "object",
        "properties": {
          "topLeftX": {"type": "number"},
          "topLeftY": {"type": "number"},
          "bottomRightX": {"type": "number"},
          "bottomRightY": {"type": "number"},
          "cont_color": {"type": "string", "description": "Color del contorn en hexadecimal (#RRGGBB)."},
          "int_color": {"type": "string", "description": "Color de l'interior en hexadecimal (#RRGGBB)."}
        },
        "required": ["topLeftX", "topLeftY", "bottomRightX", "bottomRightY"]
      }
    }
  },
  {
    "type": "function",
    "function": {
      "name": "draw_square",
      "description":
          "Dibuixa un quadrat donat el seu punt d'origen (x, y) i la seva mida (size). Si no s'especifica la mida, es genera una mida aleatòria entre 10 i 50. Es poden definir dos colors en format hexadecimal: el contorn (`cont_color`) i l'interior (`int_color`). Per defecte tots dos són negres (#000000).",
      "parameters": {
        "type": "object",
        "properties": {
          "x": {"type": "number"},
          "y": {"type": "number"},
          "size": {"type": "number"},
          "cont_color": {"type": "string", "description": "Color del contorn en hexadecimal (#RRGGBB)."},
          "int_color": {"type": "string", "description": "Color de l'interior en hexadecimal (#RRGGBB)."}
        },
        "required": ["x", "y"]
      }
    }
  },
  {
    "type": "function",
    "function": {
      "name": "draw_text",
      "description":
          "Dibuixa un text a la pantalla en una posició determinada. Es pot definir el color del text (`cont_color`) en format hexadecimal, per defecte negre (#000000).",
      "parameters": {
        "type": "object",
        "properties": {
          "text": {"type": "string"},
          "x": {"type": "number"},
          "y": {"type": "number"},
          "fontSize": {"type": "number"},
          "cont_color": {"type": "string", "description": "Color del text en hexadecimal (#RRGGBB)."}
        },
        "required": ["text", "x", "y"]
      }
    }
  }
];
