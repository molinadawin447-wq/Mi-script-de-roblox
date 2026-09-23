-- main.lua - 11 botones cuadrados con esquinas redondeadas
-- Formación escalonada, color negro oscuro

local botones = {}
local RADIO      = 14       -- radio de esquinas redondeadas
local TAMANO     = 95       -- tamaño de cada botón
local ESPACIO    = 14       -- espacio entre botones
local COLOR_BTN  = {0.10, 0.10, 0.10}   -- negro oscuro
local COLOR_EDGE = {0.28, 0.28, 0.28}   -- borde gris
local COLOR_HOV  = {0.22, 0.22, 0.22}   -- hover
local COLOR_TXT  = {0.90, 0.90, 0.90}

-- Distribución {fila, columna}
-- Fila 1: cols 1,2,3,4  -> 4 botones
-- Fila 2: cols 2,3,4    -> 3 botones
-- Fila 3: cols 3,4      -> 2 botones
-- Fila 4: cols 3,4      -> 2 botones
local DISTRIBUCION = {
    {1,1},{1,2},{1,3},{1,4},
    {2,2},{2,3},{2,4},
    {3,3},{3,4},
    {4,3},{4,4},
}

local anchoVentana, altoVentana
local fuente

-- ============================================================
-- Dibuja un rectángulo con esquinas redondeadas (RELLENO)
-- Usa polígono en lugar de círculos+rects para evitar gaps
-- ============================================================
local function rectRedondeadoRelleno(x, y, w, h, r, color)
    love.graphics.setColor(color)
    love.graphics.rectangle("fill", x + r, y,     w - 2*r, h)
    love.graphics.rectangle("fill", x,     y + r, w,       h - 2*r)
    love.graphics.circle("fill", x + r,     y + r,     r)
    love.graphics.circle("fill", x + w - r, y + r,     r)
    love.graphics.circle("fill", x + r,     y + h - r, r)
    love.graphics.circle("fill", x + w - r, y + h - r, r)
end

-- ============================================================
-- Dibuja SOLO el contorno de un rectángulo redondeado
-- ============================================================
local function rectRedondeadoBorde(x, y, w, h, r, color)
    love.graphics.setColor(color)
    love.graphics.setLineWidth(2)

    -- Líneas rectas
    love.graphics.line(x + r, y,         x + w - r, y)         -- arriba
    love.graphics.line(x + r, y + h,     x + w - r, y + h)     -- abajo
    love.graphics.line(x,     y + r,     x,         y + h - r) -- izq
    love.graphics.line(x + w, y + r,     x + w,     y + h - r) -- der

    -- Arcos (LÖVE 11: angle1, angle2 en radianes, sin modo "open")
    love.graphics.arc("line", x + r,     y + r,     r, math.pi,     math.pi * 1.5)
    love.graphics.arc("line", x + w - r, y + r,     r, math.pi*1.5, math.pi * 2)
    love.graphics.arc("line", x + w - r, y + h - r, r, 0,           math.pi * 0.5)
    love.graphics.arc("line", x + r,     y + h - r, r, math.pi*0.5, math.pi)
end

-- ============================================================
-- Carga
-- ============================================================
function love.load()
    love.graphics.setBackgroundColor(0.95, 0.95, 0.95)
    love.graphics.setDefaultFilter("linear", "linear")

    anchoVentana = love.graphics.getWidth()
    altoVentana  = love.graphics.getHeight()

    -- Fuente (LÖVE trae una por defecto, pero por si acaso)
    fuente = love.graphics.newFont(20)
    love.graphics.setFont(fuente)

    -- Calcular origen para centrar el bloque completo
    local anchoBloque = 4 * TAMANO + 3 * ESPACIO
    local altoBloque  = 4 * TAMANO + 3 * ESPACIO
    local origenX = (anchoVentana - anchoBloque) / 2
    local origenY = (altoVentana  - altoBloque)  / 2

    -- Crear los 11 botones
    botones = {}
    for i, pos in ipairs(DISTRIBUCION) do
        local fila, col = pos[1], pos[2]
        table.insert(botones, {
            x = origenX + (col - 1) * (TAMANO + ESPACIO),
            y = origenY + (fila - 1) * (TAMANO + ESPACIO),
            w = TAMANO,
            h = TAMANO,
            id = i,
            hover = false,
        })
    end
end

-- ============================================================
-- Update
-- ============================================================
function love.update(dt)
    local mx, my = love.mouse.getPosition()
    for _, b in ipairs(botones) do
        b.hover = mx >= b.x and mx <= b.x + b.w
              and my >= b.y and my <= b.y + b.h
    end
end

-- ============================================================
-- Draw
-- ============================================================
function love.draw()
    for _, b in ipairs(botones) do
        local col = b.hover and COLOR_HOV or COLOR_BTN
        rectRedondeadoRelleno(b.x, b.y, b.w, b.h, RADIO, col)
        rectRedondeadoBorde  (b.x, b.y, b.w, b.h, RADIO, COLOR_EDGE)

        -- Número del botón
        love.graphics.setColor(COLOR_TXT)
        local texto = tostring(b.id)
        local tw = fuente:getWidth(texto)
        local th = fuente:getHeight()
        love.graphics.print(texto, b.x + (b.w - tw)/2, b.y + (b.h - th)/2)
    end
end

-- ============================================================
-- Click
-- ============================================================
function love.mousepressed(x, y, button)
    if button == 1 then
        for _, b in ipairs(botones) do
            if x >= b.x and x <= b.x + b.w
           and y >= b.y and y <= b.y + b.h then
                print("Botón " .. b.id .. " presionado")
            end
        end
    end
end