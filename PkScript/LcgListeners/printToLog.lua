return function(rngSys, logger)
  return function(frame, address)
    local seed = rngSys.readSeed()
    logger.pushright(string.format("%sF,%s,%.8x\n", frame, address, seed))
  end
end
