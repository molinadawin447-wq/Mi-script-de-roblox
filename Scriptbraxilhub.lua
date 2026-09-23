-- main.lua
-- 11 botones cuadrados con esquinas redondeadas, color negro oscuro
-- Distribuidos en formación escalonada

local botones = {}
local radio = 12          -- radio de las esquinas redondeadas
local tamaño = 90         -- tamaño de cada botón (cuadrado)
local espacio = 12        -- espacio entre botones
local colorBtn = {0.10, 0.10, 0.10, 1}   -- negro oscuro
local colorBorde = {0.30, 0.30, 0.30, 1}
local colorHover = {0.22, 0.22, 0.22, 1}

-- Estructura: fila, columna (para crear el patrón escalonado)
-- Fila 1: 4 botones  -> columnas 1,2,3,4
-- Fila 2: 3 botones  -> columnas 2,3,4
-- Fila 3: 2 botones  -> columnas 3,4
-- Fila 4: 2 botones  -> columnas 3,4
local distribucion = {
    {1, 1}, {1, 2}, {1, 3}, {1, 4},   -- fila 1
    {2, 2}, {2, 3}, {2, 4},           -- fila 2
    {3, 3}, {3, 4},                   -- fila 3
    {4, 3}, {4, 4},                   -- fila 4
}

local anchoVentana, altoVentana
local origenX, origenY

function love.load()
    love.window.setTitle("11 Botones Escalonados")
    anchoVentana, altoVentana = 520, 480
    love.window.setMode(anchoVentana, altoVentana, {resizable = false})

    -- Calcular posición inicial para centrar el bloque
    local anchoBloque = 4 * tamaño + 3 * espacio
    local altoBloque  = 4 * tamaño + 3 * espacio
    origenX = (anchoVentana - anchoBloque) / 2
    origenY = (altoVentana - altoBloque) / 2

    -- Crear botones
    for i, pos in ipairs(distribucion) do
        local fila, col = pos[1], pos[2]
        local x = origenX + (col - 1) * (tamaño + espacio)
        local y = origenY + (fila - 1) * (tamaño + espacio)

        table.insert(botones, {
            x = x,
            y = y,
            w = tamaño,
            h = tamaño,
            id = i,
            hover = false,
        })
    end
end

-- Función que dibuja un rectángulo con esquinas redondeadas
local function rectRedondeado(x, y, w, h, r, color)
    love.graphics.setColor(color)
    -- Círculos en las 4 esquinas
    love.graphics.circle("fill", x + r,     y + r,     r)
    love.graphics.circle("fill", x + w - r, y + r,     r)
    love.graphics.circle("fill", x + r,     y + h - r, r)
    love.graphics.circle("fill", x + w - r, y + h - r, r)
    -- Rectángulos del centro
    love.graphics.rectangle("fill", x + r, y,     w - 2*r, h)
    love.graphics.rectangle("fill", x,     y + r, w,       h - 2*r)
end

local function rectRedondeadoLinea(x, y, w, h, r, color)
    love.graphics.setColor(color)
    love.graphics.setLineWidth(2)
    -- 4 lados
    love.graphics.line(x + r, y,         x + w - r, y)         -- arriba
    love.graphics.line(x + r, y + h,     x + w - r, y + h)     -- abajo
    love.graphics.line(x,     y + r,     x,         y + h - r) -- izq
    love.graphics.line(x + w, y + r,     x + w,     y + h - r) -- der
    -- 4 arcos
    love.graphics.arc("line", "open", x + r,     y + r,     r, math.pi,      math.pi*1.5)
    love.graphics.arc("line", "open", x + w - r, y + r,     r, math.pi*1.5,  math.pi*2)
    love.graphics.arc("line", "open", x + w - r, y + h - r, r, 0,            math.pi*0.5)
    love.graphics.arc("line", "open", x + r,     y + h - r, r, math.pi*0.5,  math.pi)
end

function love.update(dt)
    local mx, my = love.mouse.getPosition()
    for _, b in ipairs(botones) do
        b.hover = mx >= b.x and mx <= b.x + b.w
              and my >= b.y and my <= b.y + b.h
    end
end

function love.draw()
    -- Fondo
    love.graphics.setColor(0.95, 0.95, 0.95)
    love.graphics.rectangle("fill", 0, 0, anchoVentana, altoVentana)

    -- Dibujar cada botón
    for _, b in ipairs(botones) do
        local col = b.hover and colorHover or colorBtn
        rectRedondeado(b.x, b.y, b.w, b.h, radio, col)
        rectRedondeadoLinea(b.x, b.y, b.w, b.h, radio, colorBorde)

        -- Número dentro del botón
        love.graphics.setColor(0.85, 0.85, 0.85)
        local texto = tostring(b.id)
        local fuente = love.graphics.getFont()
        local tw = fuente:getWidth(texto)
        local th = fuente:getHeight()
        love.graphics.print(texto, b.x + (b.w - tw)/2, b.y + (b.h - th)/2)
    end
end

function love.mousepressed(x, y, button)
    if button == 1 then
        for _, b in ipairs(botones) do
            if b.hover then
                print("Botón " .. b.id .. " presionado")
            end
        end
    end
end
