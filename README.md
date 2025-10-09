-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  local result = vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
  if vim.v.shell_error ~= 0 then
    -- stylua: ignore
    vim.api.nvim_echo({ { ("Error cloning lazy.nvim:\n%s\n"):format(result), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
    vim.fn.getchar()
    vim.cmd.quit()
  end
end

vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

require "lazy_setup"
require "polish"
# DEX Clone - Project Overview:
## Protocol Name: SwappingDream
A simple attempt to try to replicate [Uniswap](https://www.notion.so/Uniswap-2410ddda135480b2a018ffc7a94a5f85?source=copy_link) and it’s core functions, mainly focused on learning the whole protocol, focusing on core Blockchain and DeFi concepts such as:

- 🧩 *AMMs*
- 💧 *Liquidity Pools*
- 👥 *Liquidity Providers (LP)*
- 📉 *Slippage*
- ⚖️ *Impermanent Loss*
- 💸 *Swap Fee*
- 🪙 *ERC-20 Standard*
- 🏭 *Factory Contract*
- 🧭 *Router Contracts*

> 🗒️ Note:As the development goes on, I'll be publishing some pages for each topic above so anyone can follow allong my own studying progress. LET'S BUILD⚙️!
-------------------
Beyond web3 concepts, this project also aims to deepen the understanding of **Smart Contract Development**, getting the most out of the EVM and the [Solidity](https://www.soliditylang.org/) programming languages.
    
[Uniswap](https://www.notion.so/Uniswap-2410ddda135480b2a018ffc7a94a5f85?source=copy_link)  will serve as the backbone for learning and integration, but this project will also be used to explore design choices and to further develop my React skills.

> ⚠️ Disclaimer: This project is for educational purposes only. It is not affiliated with or endorsed by Uniswap Labs.